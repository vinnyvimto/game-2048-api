defmodule Game2048Api.Repo do
  use Ecto.Repo,
    otp_app: :game_2048_api,
    adapter: Ecto.Adapters.MyXQL
end
