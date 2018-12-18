get '/find' do
  content_type :json

  UpworkJobs.new(params).find.to_json
end
