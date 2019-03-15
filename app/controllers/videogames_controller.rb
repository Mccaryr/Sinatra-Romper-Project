class VideogamesController < ApplicationController 

    get '/videogames/new' do 
        if logged_in?
        erb :'/videogames/new'
        else 
            redirect '/login'
        end  
    end 

    get '/videogames' do 
        if logged_in? 
        @user=User.find_by(params[:user_id])
        @videogames = Videogames.all 
        erb :'videogames/videogames'
        else 
            redirect '/login'
        end  
    end 

    post '/videogames' do 
        if logged_in?
            # binding.pry 
            if params[:title] ==""
                redirect '/videogames/new'
            else 
            @videogame = Videogames.create(title: params[:title], details: params[:details])
                if @videogame.save 
                    redirect "/videogames/#{@videogame.id}"
                    else 
                    redirect '/videogames/new'
                end 
            end 
        else 
        redirect '/login'
        end 
    end 

    get '/videogames/:id' do 
        if logged_in? 
        @videogame = Videogames.find_by_id(params[:id])
        erb :'videogames/show_videogames'
        else 
            redirect '/login'
        end  
    end 

    get '/videogames/:id/edit' do 
        if logged_in? 
            @videogame = Videogames.find_by_id(params[:id])
            if @videogame && @videogame.user == current_user
                erb :'/videogames/edit_videogames'
            else 
                redirect '/videogames'
            end 
        else 
            redirect '/login'
        end 
    end 

    patch '/videogames/:id' do
        if logged_in? 
            if params[:details] == "" || params[:title] == ""
                redirect "/videogames/#{params[:id]/edit}"
            else 
                @videogame = Videogames.find_by_id(params[:id])
                if @videogame && @videogame.user == current_user
                    if @videogame.update(details: params[:details], title: params[:title])
                        redirect "/videogames/#{@videogame.id}"
                    else 
                        redirect "/videogames/#{@videogame.id}/edit"
                    end 
                else 
                    redirect '/videogames'
                end 
            end 
        else 
            redirect '/login'
        end 
    end 

    delete '/videogames/:id/delete' do
        if logged_in?
          @videogame = Videogames.find_by_id(params[:id])
          if @videogame && @videogame.user == current_user
            @videogame.delete
          end
          redirect to '/videogames'
        else
          redirect to '/login'
        end
      end
end 