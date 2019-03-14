class VideogameController < ApplicationController 

    get '/videogames/new' do 
        erb :new 
    end 

    get '/videogames' do 
        if logged_in? 
        @user=User.find_by(session[:user_id])
        @videogames=Videogames.all 
        erb :'videogames/videogames'
        else 
            redirect '/login'
        end  
    end 

    get '/videogames/:id' do 
        @videogame = Videogames.find_by_id(params[:id])
        erb :'videogames/show' 
    end 

    post '/videogames' do 
        @videogame=Videogame.create(params)
        redirect "/videogames/#{videogame.id}"
    end 

    patch '/videogames/:id' do

    end 

    get '/videogames/:id/edit' do 
    videogame = Videogame.find(params[:id])
    erb :edit_videogames 
    end 

end 