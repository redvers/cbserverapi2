require Record
## Gratuitously inspired by :exrabbit.
defmodule Cbserverapi2.Records do
  Record.defrecord(:pbasic, :'P_basic',   Record.extract(:P_basic,             from_lib: "rabbit_common/include/rabbit_framing.hrl"))
  Record.defrecord(:amqp_params_network,  Record.extract(:amqp_params_network, from_lib: "amqp_client/include/amqp_client.hrl"))
  Record.defrecord(:queue_declare, :'queue.declare', Record.extract(:'queue.declare', from_lib: "rabbit_common/include/rabbit_framing.hrl"))
  Record.defrecord(:queue_declare_ok, :'queue.declare_ok', Record.extract(:'queue.declare_ok', from_lib: "rabbit_common/include/rabbit_framing.hrl"))
  Record.defrecord(:queue_bind, :'queue.bind', Record.extract(:'queue.bind', from_lib: "rabbit_common/include/rabbit_framing.hrl"))
  Record.defrecord(:queue_bind_ok, :'queue.bind_ok', Record.extract(:'queue.bind_ok', from_lib: "rabbit_common/include/rabbit_framing.hrl"))
  Record.defrecord(:basic_get, :'basic.get', Record.extract(:'basic.get', from_lib: "rabbit_common/include/rabbit_framing.hrl"))
  Record.defrecord(:basic_get_ok, :'basic.get_ok', Record.extract(:'basic.get_ok', from_lib: "rabbit_common/include/rabbit_framing.hrl"))
  Record.defrecord(:basic_consume, :'basic.consume', Record.extract(:'basic.consume', from_lib: "rabbit_common/include/rabbit_framing.hrl"))
  Record.defrecord(:basic_consume_ok, :'basic.consume_ok', Record.extract(:'basic.consume_ok', from_lib: "rabbit_common/include/rabbit_framing.hrl"))
  Record.defrecord(:basic_deliver, :'basic.deliver', Record.extract(:'basic.deliver', from_lib: "rabbit_common/include/rabbit_framing.hrl"))
end

