require 'sinatra'
require 'rest-client'
require 'json'

CLIENT_ID = ENV['60ee59289f52bf16a665']
CLIENT_SECRET = ENV['d0755f0c44c85f90b9139dd04b9fe48696cb740d']

get '/' do
    erb :index, :locals => {:client_id => CLIENT_ID}
end
get '/callback' do
    # get temporary GitHub code...
    session_code = request.env['rack.request.query_hash']['code']
  
    # ... and POST it back to GitHub
    result = RestClient.post('https://github.com/login/oauth/access_token',
                            {:client_id => CLIENT_ID,
                             :client_secret => CLIENT_SECRET,
                             :code => session_code},
                             :accept => :json)
  
    # extract the token and granted scopes
    access_token = JSON.parse(result)['access_token']
end