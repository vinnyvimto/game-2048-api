use Mix.Config

config :game_2048_api, Game2048Api.Repo,
  database: "game2048_test",
  username: "root",
  password: "toor",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

  config :game_2048_api, ecto_repos: [Game2048Api.Repo]
