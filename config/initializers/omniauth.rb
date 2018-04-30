Rails.application.config.middleware.use OmniAuth::Builder do
  
  provider :facebook, ENV['FACEBOOK_APP_KEY'], ENV['FACEBOOK_APP_SECRET'] 
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'],
    scope: 'email, profile, plus.login',
    provider_ignores_state: true,
    prompt: 'select_account',
    image_aspect_ratio: 'square',
    image_size: 100,
    skip_jwt: true
  


end



