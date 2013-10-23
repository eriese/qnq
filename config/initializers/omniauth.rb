OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "717561474938198", "87956b539c0ee9eea0d4475e6132416f"
end
