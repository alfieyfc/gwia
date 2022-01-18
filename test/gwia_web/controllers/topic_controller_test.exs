defmodule GwiaWeb.TopicControllerTest do
  use GwiaWeb.ConnCase

  import Gwia.IdentitiesFixtures

  alias Gwia.Identities.Topic

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all topics", %{conn: conn} do
      conn = get(conn, Routes.topic_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create topic" do
    test "renders topic when data is valid", %{conn: conn} do
      conn = post(conn, Routes.topic_path(conn, :create), topic: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.topic_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.topic_path(conn, :create), topic: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update topic" do
    setup [:create_topic]

    test "renders topic when data is valid", %{conn: conn, topic: %Topic{id: id} = topic} do
      conn = put(conn, Routes.topic_path(conn, :update, topic), topic: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.topic_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, topic: topic} do
      conn = put(conn, Routes.topic_path(conn, :update, topic), topic: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete topic" do
    setup [:create_topic]

    test "deletes chosen topic", %{conn: conn, topic: topic} do
      conn = delete(conn, Routes.topic_path(conn, :delete, topic))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.topic_path(conn, :show, topic))
      end
    end
  end

  defp create_topic(_) do
    topic = topic_fixture()
    %{topic: topic}
  end
end
