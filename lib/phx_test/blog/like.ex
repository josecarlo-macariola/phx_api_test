defmodule  PhxTest.Blog.Like do
  use Ecto.Schema

  alias PhxTest.Post
  alias PhxTest.Account.User

  schema "user_like_post" do
    belongs_to :post, Post
    belongs_to :user, User

    timestamps()
  end
end
