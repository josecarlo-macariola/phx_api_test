defmodule PhxTest.Blog do

  alias PhxTest.Blog.{ Post, UserPost , Like}
  alias PhxTest.Repo
  import Ecto.Changeset
  def add_user_post(post, user) do

    user_post = %UserPost{
      post: create_post(post),
      user: user
    }
    Repo.insert(user_post)
  end

  def add_user_like(post, user) do
    user_like = %Like{
      post: post,
      user: user
    }
    Repo.insert(user_like)
  end

  def get_post(post_id) do
        Repo.get(Post, post_id)
  end

  def create_post( params ) do

      post_changeset(params)
       |> Repo.insert
  end

   def post_changeset(params \\ %{}) do
     %Post{}
     |> cast(params, [:filename, :content_type, :path])
   end

end
