defmodule PhxTest.Web.Router do
  use PhxTest.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :api_auth do
      plug Guardian.Plug.VerifyHeader, realm: "Bearer"
      plug Guardian.Plug.LoadResource
  end

  scope "/", PhxTest.Web do
    pipe_through :api # Use the default browser stack
    pipe_through :api_auth
    
    post "/create_user", UserController, :create
    post "/upload_photo", PostController, :upload
    post "/login_user", UserController, :login_user
    get "/:id", UserController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhxTest.Web do
  #   pipe_through :api
  # end
end
