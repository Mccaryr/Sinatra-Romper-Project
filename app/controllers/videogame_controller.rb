class VideogamesController < ApplicationController 

    get '/videogames/new' do 
        erb :new 
    end 

    get '/videogames' do 
        binding.pry
        if logged_in? 
        @user=User.find_by(params[:user_id])
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
        if logged_in?
            if params[:title] ==""
                redirect '/videogames/new'
            else 
            @videogame=current_user.videogames.build(title: params[:title], details: params[:details])
                if @videogame.save 
                    redirect "/videogames/#{videogame.id}"
                    else 
                    redirect '/videogames/new'
                end 
            end 
        else 
        redirect '/login'
        end 
    end 

    patch '/videogames/:id' do

    end 

    get '/videogames/:id/edit' do 
    videogame = Videogame.find(params[:id])
    erb :edit_videogames 
    end 

end 