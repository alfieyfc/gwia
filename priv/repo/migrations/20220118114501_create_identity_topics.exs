defmodule Gwia.Repo.Migrations.CreateIdentityTopics do
  use Ecto.Migration

  def change do
    create table(:identity_topics) do
      add :identity_id, references(:identities, on_delete: :delete_all)
      add :topic_id, references(:topics, on_delete: :delete_all)

      timestamps()
    end

    create unique_index(:identity_topics, [:identity_id, :topic_id])
  end
end
