Rails.application.config.middleware.use OmniAuth::Builder do
	provider :twitter, 'ARzSOraY5kZbKJ66sJoGYg', 'AVuLy9zFT21jEm7OLnNcBROZWrpkTA4sO5jlWpacUKk'
	# provider :facebook, 'APP_ID', 'APP_SECRET'
	# provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end