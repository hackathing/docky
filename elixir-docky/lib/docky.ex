defmodule Docky do
  use Application

  def start(_type, _args) do
    port = get_port()
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

  defp get_port do
    case System.get_env("PORT") do
      nil ->
        4000
      p ->
        {port, _} = Integer.parse(p)
        port
    end
  end
end
