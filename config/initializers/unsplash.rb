Unsplash.configure do |config|
  config.application_id     = ENV["US_ID"]
  config.application_secret = ENV["US_SECRET"]
  config.application_redirect_uri = "https://your-application.com/oauth/callback"
  config.utm_source = "alices_terrific_client_app"
end
