class AddRatingColumn < ActiveRecord::Migration
  def change
    add_column :tracks, :rating, :integer
  end
end
