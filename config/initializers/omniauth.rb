Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'da51e44565b8cc05d745', '31cceb0f8281be7f408df600125c639afd1b7c48'
end