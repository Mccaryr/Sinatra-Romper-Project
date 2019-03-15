class CreateVideogamesTable < ActiveRecord::Migration[4.2]
  def change
    create_table :videogames do |t|
      t.text :details
      t.string :title 
      t.integer :user_id 
    end 
  end
end
