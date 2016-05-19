class AddUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
        t.string :username
        t.string :password 
        t.timestamp
    end 
  end
end
