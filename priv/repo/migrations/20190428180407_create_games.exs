defmodule Game2048Api.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :hash, :string
      add :value_matrix, :text
      add :score, :"int unsigned"
      
      add :inserted_at, :timestamp, default: fragment("NOW()")
      add :updated_at, :timestamp, default: fragment("NOW() ON UPDATE NOW()")
    end
  end
end
