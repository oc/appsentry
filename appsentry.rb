require 'rubygems'
require 'sinatra'
require 'yecht'
require 'lib/beeu'
require 'lib/bumble'
 
get '/' do
  "Nothing here just yet!"
end

get '/check' do
  "Fire monitor!"
end

get '/protected' do
  require_user
  "Logged in user!"
end

get '/admin' do
  require_admin
  "You BOFH you."
end
  
