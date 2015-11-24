defmodule Cbprotobuf do
  use Protobuf, from: Path.expand("./sensor_events.proto", __DIR__)
end
