defmodule PhxTest.Account.User do
  use Ecto.Schema

  schema "users" do
    field :email, :string
    field :encrypted_password, :string
    field :password, :string, virtual: true
    field :username, :string

    timestamps()
  end

end
