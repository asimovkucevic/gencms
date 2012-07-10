
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter,  ENV['NgQvlZy9CO8YmDGzeDQUTA'], ENV['bSxqf4EbbvUPaowN1sEckb6F1ujBbxUDLWKXq4Q1k']  


  # => "NgQvlZy9CO8YmDGzeDQUTA", "bSxqf4EbbvUPaowN1sEckb6F1ujBbxUDLWKXq4Q1k" 
end