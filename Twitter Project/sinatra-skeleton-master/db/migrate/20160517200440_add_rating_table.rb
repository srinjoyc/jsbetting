class AddRatingTable < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
        t.integer :value 
        t.references :track
        t.references :user
        t.timestamp 
    end  
  end
end
