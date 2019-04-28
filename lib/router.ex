defmodule Game2048Api.Router do
  use Plug.Router

  plug(Corsica, origins: "http://localhost:8080")

  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(:dispatch)

  get "/api/v1" do
    version = List.to_string(Application.spec(:game_2048_api, :vsn))
    send_resp(conn, 200, "Game 2048 API v#{version}")
  end

  get "/api/v1/games" do
    game = Game2048Api.Game |> Ecto.Query.last() |> Game2048Api.Repo.one()

    if game do
      data = %{
        value_matrix: game.value_matrix,
        score: game.score
      }

      send_resp(conn, 200, Jason.encode!(data))
    else
      send_resp(conn, 404, "Not found")
    end
  end

  match _ do
    send_resp(conn, 404, "Not found")
  end
end
