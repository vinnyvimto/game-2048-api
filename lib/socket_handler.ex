defmodule Game2048Api.SocketHandler do
  @behaviour :cowboy_websocket

  def init(request, _state) do
    state = %{registry_key: request.path}

    {:cowboy_websocket, request, state}
  end

  def websocket_init(state) do
    # IO.inspect(self())
    Registry.Game2048Api
    |> Registry.register(state.registry_key, {})

    {:ok, state}
  end

  def websocket_handle({:text, json}, state) do
    # IO.inspect binding()

    payload = Jason.decode!(json)
    message = payload["data"]["message"]

    decoded = Jason.decode!(message)

    game = Game2048Api.Game |> Ecto.Query.last() |> Game2048Api.Repo.one()

    valueMatrix = Jason.encode!(Map.get(decoded, "newValMatrix"))
    data = %{value_matrix: valueMatrix, score: Map.get(decoded, "score")}

    if game do
      # Update the existing game
      changeset = Game2048Api.Game.changeset(game, data)
      Game2048Api.Repo.update(changeset)
    else
      # Create new game
      game = %Game2048Api.Game{}
      changeset = Game2048Api.Game.changeset(game, data)
      Game2048Api.Repo.insert(changeset)
    end

    Registry.Game2048Api
    |> Registry.dispatch(state.registry_key, fn entries ->
      for {pid, _} <- entries do
        if pid != self() do
          Process.send(pid, message, [])
        end
      end
    end)

    {:reply, {:text, message}, state}
  end

  def websocket_info(info, state) do
    {:reply, {:text, info}, state}
  end
end
