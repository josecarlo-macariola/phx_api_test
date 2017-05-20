defmodule PhxTest.Web.UserController do
  use PhxTest.Web, :controller

  alias PhxTest.Account
  alias PhxTest.Account.User
  alias PhxTest.Account.Session

  action_fallback PhxTest.Web.FallbackController


  def create(conn, user_params) do
    with {:ok, %User{} = user} <- Account.create_user(user_params) do
      conn
      |> put_status(:created)
      |> render("show.json", user: user)
    end
  end
  def show(conn, %{"id" => user_id}) do
     user = Account.get_user(user_id)

     if user do
       render(conn, "show.json", user: user)
     end
   end
  def login_user(conn, credentials) do
   case Session.authenticate(credentials) do
        {:ok, %{username: username} = user} ->
          new_conn = Guardian.Plug.api_sign_in(conn, user)
          jwt = Guardian.Plug.current_token(new_conn)
          {:ok, claims} = Guardian.Plug.claims(new_conn)
           exp = Map.get(claims, "exp")
          # IO.inspect exp
          new_conn
             |> put_resp_header("authorization", "Bearer #{jwt}")
             |> put_resp_header("x-expires", "#{exp}")
             |> render "login.json", user: user, jwt: jwt, exp: exp
        {:error, message} ->
          conn
          |> put_status(401)
          |> render "error.json", message: "Could not login"
      end
    end

    def logout(conn, _params) do
      jwt = Guardian.Plug.current_token(conn)
      claims = Guardian.Plug.claims(conn)
      Guardian.revoke!(jwt, claims)
      render "logout.json"
    end
end
