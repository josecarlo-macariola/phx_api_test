# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phx_test,
  ecto_repos: [PhxTest.Repo]

# Configures the endpoint
config :phx_test, PhxTest.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+hSbdPNBtJDSOVwSwIb+ZrfZOPs4XpTdaUssRKJv0lb9LydfDJVdYGF1k+z4+Hzo",
  render_errors: [view: PhxTest.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhxTest.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

  config :guardian, Guardian,
    issuer: "PhxTest",
    ttl: { 30, :days },
    allowed_drift: 2000,
    secret_key: "LsOD5r7ndts0ZytCQOBbPWdlecrsRtCDhk+SqdWZCZkjeysPy0IRBBe0y+xJmqre",
    serializer: PhxTest.Account.GuardianSerializer

config :arc,
  storage: Arc.Storage.Local
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
