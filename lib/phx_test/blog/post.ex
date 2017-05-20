defmodule PhxTest.Blog.Post do

  use Ecto.Schema

  schema "post" do
    field :filename, :string
    field :content_type, :string
    field :path, :string

    timestamps()
  end

end
