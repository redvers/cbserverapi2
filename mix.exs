defmodule Cbserverapi2.Mixfile do
  use Mix.Project

  def project do
    [app: :cbserverapi2,
     version: "0.0.1",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :amqp_client, :rabbit_common],
     mod: {Cbserverapi2, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:amqp_client, git: "https://github.com/jbrisbin/amqp_client.git"},
      {:exprotobuf, "~> 0.12.0"}

    ]
  end
end
