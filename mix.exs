defmodule Game2048Api.MixProject do
  use Mix.Project

  def project do
    [
      app: :game_2048_api,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Game2048Api, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, "~> 2.4"},
      {:plug, "~> 1.7"},
      {:plug_cowboy, "~> 2.0"},
      {:jason, "~> 1.1"},
      {:ecto_sql, "~> 3.0"},
      {:myxql, "~> 0.2.0"},
      {:corsica, "~> 1.0"}
    ]
  end
end
