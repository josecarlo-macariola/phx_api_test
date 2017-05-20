defmodule PhxTest.Web.UserView do
  use PhxTest.Web, :view
  alias PhxTest.Web.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end
  def render("login.json", %{user: user, jwt: jwt, exp: exp}) do
    %{data: render_one(%{user: user, jwt: jwt, exp: exp}, UserView, "user_login.json")}
  end
  def render("user.json", %{user: user}) do
    %{id: user.id,
      username: user.username,
      email: user.email,
      encrypted_password: user.encrypted_password,
      password: user.password}
  end

  def render("user_login.json", %{user: user}) do
    %{
      exp: user.exp,
      jwt: user.jwt,
      user: user.user.username
      }
   #IO.inspect user
   end
end
