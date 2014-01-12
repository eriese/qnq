OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "660206197350699", "ff0342990add6258463c067d7bcb79f9"
end
