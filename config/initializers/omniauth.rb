
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter,  'U0wUYvkL2UOjB8BB2szdA', '7zFc8S7P1cCP9ASzpAfZQ3m17OUASnNxoJ98F6pjII'
  provider :facebook,  '257853167662373', 'f909e4a9cbe91d2612d34f6e052a6946', {:client_options => {:ssl => {:verify => false}}}
 	provider :google_oauth2, '501165526276.apps.googleusercontent.com', '2AYn_6RhnVUIF7ehtV4i_C9N',     
{:client_options => {:ssl => {:verify => false}}} 	
	provider :linkedin, '2w9v9l743qbh', 'JwuP07fsHloynjZF'
end