defmodule Gwia.IdentitiesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Gwia.Identities` context.
  """

  @doc """
  Generate a identity.
  """
  def identity_fixture(attrs \\ %{}) do
    {:ok, identity} =
      attrs
      |> Enum.into(%{
        id: 42,
        name: "some name"
      })
      |> Gwia.Identities.create_identity()

    identity
  end

  @doc """
  Generate a identity.
  """
  def identity_fixture(attrs \\ %{}) do
    {:ok, identity} =
      attrs
      |> Enum.into(%{
        name: "some name",
        value: 42
      })
      |> Gwia.Identities.create_identity()

    identity
  end

  @doc """
  Generate a topic.
  """
  def topic_fixture(attrs \\ %{}) do
    {:ok, topic} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Gwia.Identities.create_topic()

    topic
  end
end
