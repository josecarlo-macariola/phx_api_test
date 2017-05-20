defmodule PhxTest.Web.PostController do
  use PhxTest.Web, :controller

  plug Guardian.Plug.EnsureAuthenticated, handler: __MODULE__

  alias PhxTest.Blog
  alias PhxTest.Blog.Post

  def unauthenticated(conn, _params) do
    conn
    |> put_status(401)
    |> render "error.json", message: "Authentication required"
  end

  def upload(conn , %{"image" => image} = params)  do

 user = Guardian.Plug.current_resource(conn)
    with {:ok, %Post{} = post} <- Blog.add_user_post(image, user) do
      conn
      |> put_status(:created)
      |> render("show.json", user: user)
    end
  end
end
