defmodule Gwia.Utilities.Insert do
  alias Ecto.Changeset
  alias Gwia.Repo
  alias Gwia.Identities.{Identity, Topic, IdentityTopic}

  def maybe_insert_identity(value, name) do
    %Identity{}
    |> Changeset.change(name: name, value: value)
    |> Changeset.unique_constraint([:value])
    |> Repo.insert()
    |> case do
      {:ok, identity} -> identity
      {:error, _} -> Repo.get_by!(Identity, value: value)
    end
  end

  def maybe_insert_topic(name) do
    %Topic{}
    |> Changeset.change(name: name)
    |> Changeset.unique_constraint([:name])
    |> Repo.insert()
    |> case do
      {:ok, topic} -> topic
      {:error, _} -> Repo.get_by!(Topic, name: name)
    end
  end

  def maybe_insert_identity_topic(i_id, t_id) do
    %IdentityTopic{}
    |> Changeset.change(identity_id: i_id, topic_id: t_id)
    |> Changeset.unique_constraint([:identity_id, :topic_id])
    |> Repo.insert()
    |> case do
      {:ok, identity_topic} -> identity_topic
      {:error, _} -> Repo.get_by!(IdentityTopic, identity_id: i_id, topic_id: t_id)
    end
  end
end
