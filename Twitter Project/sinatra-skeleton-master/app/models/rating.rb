class Rating < ActiveRecord::Base
    belongs_to :user
    belongs_to :track 

    validates :user, presence: true, uniqueness: true 
end 