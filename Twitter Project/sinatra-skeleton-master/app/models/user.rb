class User < ActiveRecord::Base 
    has_many :tracks
    has_many :ratings 
end 