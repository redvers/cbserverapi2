import Cbserverapi2.Records

require Logger
defmodule Cbserverapi2.Worker do
  defstruct pid: nil, channel: nil, queue: nil, tag: nil, callback: nil
  use GenServer

  def start_link(key) do
    GenServer.start_link(__MODULE__, {key, fn(x) -> IO.puts(inspect(x)) end}, name: String.to_atom(key))
  end


  def start_link(key, callback) do
    GenServer.start_link(__MODULE__, {key, callback}, name: String.to_atom(key))
  end

  def init({key, callback}) do
    creds = Application.get_env(:cbserverapi2, :creds)
    {:ok, pid} = Cbserverapi2.Records.amqp_params_network(
      username: creds[:username],
      password: creds[:password],
      host: String.to_char_list(creds[:hostname]),
      virtual_host: "/",
      port: creds[:port],
      heartbeat: 0
      ) |> :amqp_connection.start

    {:ok, channel} = :amqp_connection.open_channel(pid)
    queue_declare_ok(queue: queue) = :amqp_channel.call channel, queue_declare(auto_delete: true)
    stuff = queue_bind_ok() = :amqp_channel.call channel, queue_bind(queue: queue, exchange: "api.events", routing_key: key)

    sub = basic_consume(queue: queue)
    tag = :amqp_channel.call(channel, sub)

    Process.link(pid)
    Process.link(channel)

    {:ok, %Cbserverapi2.Worker{pid: pid, channel: channel, queue: queue, tag: tag, callback: callback}}

  end

  def handle_info(data, state) do
    state.callback.(data)
    {:noreply, state}
  end


end
