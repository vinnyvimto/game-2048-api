defmodule Game2048Api do
  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: Game2048Api.Router,
        options: [
          dispatch: dispatch(),
          port: 4000
        ]
      ),
      # Use Elixirs registry module as dispatcher for incoming websocket requests
      Registry.child_spec(
        keys: :duplicate,
        name: Registry.Game2048Api
      )
    ]

    opts = [strategy: :one_for_one, name: Game2048Api.Application]
    Supervisor.start_link(children, opts)
  end

  defp dispatch do
    [
      {:_,
       [
         {"/ws/[...]", Game2048Api.SocketHandler, []},
         {:_, Plug.Cowboy.Handler, {Game2048Api.Router, []}}
       ]}
    ]
  end
end
