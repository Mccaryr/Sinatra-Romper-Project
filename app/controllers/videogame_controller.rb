class VideogameController < ApplicationController 

    get '/videogames/new' do 
        erb :new 
    end 

    get '/videogames' do 
        @videogames=Videogame.all 
        erb :videogames 
    end 

    get '/videogames/:id' do 
        @videogame = Videogame.find(params[:id])
        erb :show 
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