defmodule PhxTest.Web.UserControllerTest do
  use PhxTest.Web.ConnCase

  alias PhxTest.Account
  alias PhxTest.Account.User

  @create_attrs %{email: "someemail@email.com", encrypted_password: "some encrypted_password", password: "some password", username: "some username"}
  @update_attrs %{email: "someemail2@email.com", encrypted_password: "some updated encrypted_password", password: "some updated password", username: "some updated username"}
  @invalid_attrs %{email: nil, encrypted_password: nil, password: nil, username: nil}

  def fixture(:user) do
    {:ok, user} = Account.create_user(@create_attrs)
    user
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end


  test "creates user and renders user when data is valid", %{conn: conn} do
    conn = post conn, user_path(conn, :create), user: @create_attrs
    assert %{"id" => id} = json_response(conn, 201)["data"]

    conn = get conn, user_path(conn, :show, id)
    assert json_response(conn, 200)["data"] == %{
      "id" => id,
      "email" => "someemail@email.com",
      "username" => "some username"}
  end

  setup do
    user = Account.create_user(@create_attrs)
    {:ok, jwt, full_claims} = Guardian.encode_and_sign(user)
    {:ok, %{user: user, jwt: jwt, claims: full_claims}}
  end

  test "GET /api", %{jwt: jwt} do
    conn = conn()
      |> put_req_header("authorization", "Bearer #{jwt}")
      |> get "/api"

    # test things
  end
end
