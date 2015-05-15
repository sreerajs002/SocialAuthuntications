OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 'facebook_key', 'Facebook_secret'
  provider :twitter, "twitter_key", "twitter_secret"
  provider :linkedin, "linkedin_key", "linkedin_secret"
  provider :google_oauth2, "google_key" ,"google_secret"
end
