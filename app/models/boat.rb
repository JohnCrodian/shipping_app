class Boat < ApplicationRecord
	belongs_to :user
	has_and_belongs_to_many :jobs

	# def cities
	# 	attr_accessor :cities

	# 	def initialize
	# 		@cities = ["Houston", "New York", "Singapore", "Rotterdam", "Hamburg", "Rio de Janeiro", "Lagos", "Shanghai", "Tokyo", "London"]
	# 	end
	# end

end
