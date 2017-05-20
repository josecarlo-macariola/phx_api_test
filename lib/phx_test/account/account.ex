defmodule PhxTest.Account do

  import Ecto.Query, warn: false
  import Ecto.Changeset
  alias PhxTest.Repo
  alias PhxTest.Account.User

  def create_user( params = %{"password" => password}  ) do

    # Encrypt the password with Comeonin:
    encrypted_password = Comeonin.Bcrypt.hashpwsalt(password)
      register_changeset(params)
       |> put_change(:encrypted_password, encrypted_password)
       |> Repo.insert
  end
  def get_user(user_id) do
       Repo.get(User, user_id)
  end
   def register_changeset(params \\ %{}) do
     %User{}
     |> cast(params, [:username, :email, :password])
     |> validate_required([:username, :email, :password])
     |> unique_constraint(:email)
      #  |> unique_constraint(:username)
      #  |> validate_format(:email, ~r/@/)
      #  |> validate_length(:password, min: 4)
   end
end
