use Mix.Config

config :game_2048_api, Game2048Api.Repo,
  database: "game2048",
  username: "root",
  password: "toor",
  hostname: "localhost"

config :game_2048_api, ecto_repos: [Game2048Api.Repo]
