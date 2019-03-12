class User < ActiveRecord::Base 
    has_many :videogames

    has_secure_password 
end 