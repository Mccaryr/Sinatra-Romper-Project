require './config/environment'

class ApplicationController < Sinatra::Base

 

  configure do
    # set :public_folder, 'public'
    set :public_dir, "public"
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "videogame_secret"
  end

  get '/' do 
    erb :index
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @u ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

  end
end