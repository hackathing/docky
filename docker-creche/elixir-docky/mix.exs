defmodule Docky.Mixfile do
  use Mix.Project

  def project do
    [app: :docky,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:logger, :plug, :cowboy],
     mod: {Docky, []}]
  end

  defp deps do
    [{:cowboy, "~> 1.0.0"},
     {:plug, "~> 1.0"},
     {:distillery, "~> 1.0"}]
  end
end
