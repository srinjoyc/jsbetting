class AddTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
        t.string :title
        t.string :author
        t.string :URL
        t.timestamps
    end 
  end
end
