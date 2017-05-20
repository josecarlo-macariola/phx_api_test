defmodule PhxTest.Web.PostView do
  use PhxTest.Web, :view
  alias PhxTest.Web.PostView

  def render("index.json", %{posts: posts}) do
    %{data: render_many(posts, PostView, "image.json")}
  end

  def render("show.json", %{post: post}) do
    %{data: render_one(post, PostView, "image.json")}
  end

  def render("post.json", %{post: post}) do
    %{id: post.id,
      filename: post.filename,
      content_type: post.content_type,
      path: post.path }
  end
end
