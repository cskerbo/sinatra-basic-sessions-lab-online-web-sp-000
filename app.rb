require_relative 'config/environment'
require 'securerandom'

class App < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, ENV.fetch('SESSION_SECRET') {SecureRandom.hex(64)}
  end

  get '/' do
    @session = session
    erb :index
  end

  post '/checkout' do
    session['item'] = params[:item]
    erb :purchase
  end
end
