require Logger

defmodule Cbserverapi2.Connection.Supervisor do
  use Supervisor

  def start_link() do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init([]) do
    children = [
      worker(Cbserverapi2.Worker, [], restart: :permanent)
    ]
    supervise(children, strategy: :simple_one_for_one)
  end

end
