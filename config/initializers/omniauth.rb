Rails.application.config.middleware.use OmniAuth::Builder do
  config = YAML.load_file(Rails.root.join('config', 'oauth.yml')).recursive_symbolize_keys!

  env = Rails.env.to_sym
  provider :github,   config[env][:github][:api_key],   config[env][:github][:api_secret], scope: 'repo'
end
