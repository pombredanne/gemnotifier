Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '8763abb7df5d1e051cd4', '31b04002ab61f6f437c50eecda84a81bda56f226'
#  provider :facebook, 'APP_ID', 'APP_SECRET'
#  provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end
