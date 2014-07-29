class Movie < ActiveRecord::Base
	has_many :genres
	has_many :actors
end
