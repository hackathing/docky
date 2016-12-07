defmodule Docky do
  use Application

  def start(_type, _args) do
    port = System.get_env("PORT") || 4000
    IO.puts """
    Elixir HTTP server starting on port #{port}
    """

    import Supervisor.Spec, warn: false
    children = [
      Plug.Adapters.Cowboy.child_spec(:http, Docky.Web, [], [port: port]),
    ]
    opts = [strategy: :one_for_one, name: Docky.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
