class UserController < ApplicationController 

    get '/signup' do 

    end
    
    post '/signup' do 

    end 

    get '/login' do 

    end
    
    post '/login' do 

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