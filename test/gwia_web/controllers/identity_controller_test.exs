defmodule GwiaWeb.IdentityControllerTest do
  use GwiaWeb.ConnCase

  import Gwia.IdentitiesFixtures

  alias Gwia.Identities.Identity

  @create_attrs %{
    name: "some name",
    value: 42
  }
  @update_attrs %{
    name: "some updated name",
    value: 43
  }
  @invalid_attrs %{name: nil, value: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all identities", %{conn: conn} do
      conn = get(conn, Routes.identity_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create identity" do
    test "renders identity when data is valid", %{conn: conn} do
      conn = post(conn, Routes.identity_path(conn, :create), identity: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.identity_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "name" => "some name",
               "value" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.identity_path(conn, :create), identity: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update identity" do
    setup [:create_identity]

    test "renders identity when data is valid", %{conn: conn, identity: %Identity{id: id} = identity} do
      conn = put(conn, Routes.identity_path(conn, :update, identity), identity: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.identity_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "name" => "some updated name",
               "value" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, identity: identity} do
      conn = put(conn, Routes.identity_path(conn, :update, identity), identity: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete identity" do
    setup [:create_identity]

    test "deletes chosen identity", %{conn: conn, identity: identity} do
      conn = delete(conn, Routes.identity_path(conn, :delete, identity))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.identity_path(conn, :show, identity))
      end
    end
  end

  defp create_identity(_) do
    identity = identity_fixture()
    %{identity: identity}
  end
end
