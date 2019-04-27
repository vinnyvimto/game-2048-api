defmodule Game2048Api.Router do
  use Plug.Router

  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(:dispatch)

  get "/" do
    version = List.to_string Application.spec(:game_2048_api, :vsn)
    send_resp(conn, 200, "Game 2048 API v#{version}")
  end

  match _ do
    send_resp(conn, 404, "404")
  end
end
