class UserController < ApplicationController 

    get '/signup' do 
        if !logged_in? 
        erb :'/users/create_user'
        else 
            redirect '/videogames/videogames'
    end
    
    post '/signup' do 
        if params[:username] == "" || params[:password] == ""
            redirect '/signup'
        else 
            user=User.new(params)
            if user.save 
                session[:user_id]=user.user_id
                redirect '/videogames/videogames'
            else 
                redirect '/signup'
            end 
        end 
    end 

    get '/login' do 
        if !logged_in? 
            redirect '/users/login'
        else 
        redirect '/videogames'
        end 
    end
    
    post '/login' do 
        @user=User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id]= @user.id 
            redirect '/videogames/videogames'
        else 
            redirect '/signup'
            end 
        end 
    end 

    get '/logout' do 
        if logged_in? 
            session.destroy 
            redirect '/login'
        else 
            redirect '/'
        end 
    end 
end 