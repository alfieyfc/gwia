defmodule Gwia.IdentitiesTest do
  use Gwia.DataCase

  alias Gwia.Identities

  describe "identities" do
    alias Gwia.Identities.Identity

    import Gwia.IdentitiesFixtures

    @invalid_attrs %{id: nil, name: nil}

    test "list_identities/0 returns all identities" do
      identity = identity_fixture()
      assert Identities.list_identities() == [identity]
    end

    test "get_identity!/1 returns the identity with given id" do
      identity = identity_fixture()
      assert Identities.get_identity!(identity.id) == identity
    end

    test "create_identity/1 with valid data creates a identity" do
      valid_attrs = %{id: 42, name: "some name"}

      assert {:ok, %Identity{} = identity} = Identities.create_identity(valid_attrs)
      assert identity.id == 42
      assert identity.name == "some name"
    end

    test "create_identity/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Identities.create_identity(@invalid_attrs)
    end

    test "update_identity/2 with valid data updates the identity" do
      identity = identity_fixture()
      update_attrs = %{id: 43, name: "some updated name"}

      assert {:ok, %Identity{} = identity} = Identities.update_identity(identity, update_attrs)
      assert identity.id == 43
      assert identity.name == "some updated name"
    end

    test "update_identity/2 with invalid data returns error changeset" do
      identity = identity_fixture()
      assert {:error, %Ecto.Changeset{}} = Identities.update_identity(identity, @invalid_attrs)
      assert identity == Identities.get_identity!(identity.id)
    end

    test "delete_identity/1 deletes the identity" do
      identity = identity_fixture()
      assert {:ok, %Identity{}} = Identities.delete_identity(identity)
      assert_raise Ecto.NoResultsError, fn -> Identities.get_identity!(identity.id) end
    end

    test "change_identity/1 returns a identity changeset" do
      identity = identity_fixture()
      assert %Ecto.Changeset{} = Identities.change_identity(identity)
    end
  end

  describe "identities" do
    alias Gwia.Identities.Identity

    import Gwia.IdentitiesFixtures

    @invalid_attrs %{name: nil, value: nil}

    test "list_identities/0 returns all identities" do
      identity = identity_fixture()
      assert Identities.list_identities() == [identity]
    end

    test "get_identity!/1 returns the identity with given id" do
      identity = identity_fixture()
      assert Identities.get_identity!(identity.id) == identity
    end

    test "create_identity/1 with valid data creates a identity" do
      valid_attrs = %{name: "some name", value: 42}

      assert {:ok, %Identity{} = identity} = Identities.create_identity(valid_attrs)
      assert identity.name == "some name"
      assert identity.value == 42
    end

    test "create_identity/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Identities.create_identity(@invalid_attrs)
    end

    test "update_identity/2 with valid data updates the identity" do
      identity = identity_fixture()
      update_attrs = %{name: "some updated name", value: 43}

      assert {:ok, %Identity{} = identity} = Identities.update_identity(identity, update_attrs)
      assert identity.name == "some updated name"
      assert identity.value == 43
    end

    test "update_identity/2 with invalid data returns error changeset" do
      identity = identity_fixture()
      assert {:error, %Ecto.Changeset{}} = Identities.update_identity(identity, @invalid_attrs)
      assert identity == Identities.get_identity!(identity.id)
    end

    test "delete_identity/1 deletes the identity" do
      identity = identity_fixture()
      assert {:ok, %Identity{}} = Identities.delete_identity(identity)
      assert_raise Ecto.NoResultsError, fn -> Identities.get_identity!(identity.id) end
    end

    test "change_identity/1 returns a identity changeset" do
      identity = identity_fixture()
      assert %Ecto.Changeset{} = Identities.change_identity(identity)
    end
  end

  describe "topics" do
    alias Gwia.Identities.Topic

    import Gwia.IdentitiesFixtures

    @invalid_attrs %{name: nil}

    test "list_topics/0 returns all topics" do
      topic = topic_fixture()
      assert Identities.list_topics() == [topic]
    end

    test "get_topic!/1 returns the topic with given id" do
      topic = topic_fixture()
      assert Identities.get_topic!(topic.id) == topic
    end

    test "create_topic/1 with valid data creates a topic" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Topic{} = topic} = Identities.create_topic(valid_attrs)
      assert topic.name == "some name"
    end

    test "create_topic/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Identities.create_topic(@invalid_attrs)
    end

    test "update_topic/2 with valid data updates the topic" do
      topic = topic_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Topic{} = topic} = Identities.update_topic(topic, update_attrs)
      assert topic.name == "some updated name"
    end

    test "update_topic/2 with invalid data returns error changeset" do
      topic = topic_fixture()
      assert {:error, %Ecto.Changeset{}} = Identities.update_topic(topic, @invalid_attrs)
      assert topic == Identities.get_topic!(topic.id)
    end

    test "delete_topic/1 deletes the topic" do
      topic = topic_fixture()
      assert {:ok, %Topic{}} = Identities.delete_topic(topic)
      assert_raise Ecto.NoResultsError, fn -> Identities.get_topic!(topic.id) end
    end

    test "change_topic/1 returns a topic changeset" do
      topic = topic_fixture()
      assert %Ecto.Changeset{} = Identities.change_topic(topic)
    end
  end
end
