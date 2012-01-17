require 'sinatra'

ip_hash = {}

get '/set' do               
  ip_hash[params['name']] = params['ip']
  "Done!"
end

get '/display' do
  ip_hash.inspect
end     

get '/clear' do
  ip_hash.clear
end

get '/*' do
  destination = params[:splat].first
  if ip_hash.include?(destination)
    [302, {'Location' => "http://#{ip_hash[destination]}"}, "Transferring!"]
  else
    "Not found. Sorry about that."
  end
end