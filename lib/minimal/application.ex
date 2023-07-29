defmodule Minimal.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  require Logger

  @ip {0, 0, 0, 0}
  @port 4400

  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: Minimal, options: [ip: @ip, port: @port]}
    ]

    Logger.info(fn -> "Listening on http://#{format_ip(@ip)}:#{@port}" end)
    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Minimal.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp format_ip({a, b, c, d}) do
    "#{a}.#{b}.#{c}.#{d}"
  end
end
