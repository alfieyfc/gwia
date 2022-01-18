defmodule Gwia.Repo.Migrations.CreateIdentities do
  use Ecto.Migration

  def change do
    create table(:identities) do
      add :value, :integer
      add :name, :string

      timestamps()
    end
  end
end
