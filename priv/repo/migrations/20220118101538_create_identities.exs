defmodule Gwia.Repo.Migrations.CreateIdentities do
  use Ecto.Migration

  def change do
    create table(:identities) do
      add :value, :integer
      add :name, :string

      timestamps()
    end

    create unique_index(:identities, :value)
  end
end
