class Videogame < ActiveRecord::Base 
    belongs_to :user
    validates :title, presence: true
    validates :details, presence: true 
end 