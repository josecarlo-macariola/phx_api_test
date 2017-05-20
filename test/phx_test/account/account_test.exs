defmodule PhxTest.AccountTest do
  use PhxTest.DataCase

  alias PhxTest.Account

  describe "users" do
    alias PhxTest.Account.User

    @valid_attrs %{email: "some email", encrypted_password: "some encrypted_password", password: "some password", username: "some username"}
    @update_attrs %{email: "some updated email", encrypted_password: "some updated encrypted_password", password: "some updated password", username: "some updated username"}
    @invalid_attrs %{email: nil, encrypted_password: nil, password: "nil", username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_user()

      user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Account.create_user(@valid_attrs)
      assert user.email == "some email"
      # assert user.password == "some password"
      # assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_user(@invalid_attrs)
    end

  end
end
