class Boat < ApplicationRecord
	belongs_to :user
	has_and_belongs_to_many :jobs
	has_attached_file :avatar

	validates :name, uniqueness: true
	validates_attachment_content_type :avatar,
        :content_type => /\Aimage\/.*\Z/

	# def cities
	# 	attr_accessor :cities

	# 	def initialize
	# 		@cities = ["Houston", "New York", "Singapore", "Rotterdam", "Hamburg", "Rio de Janeiro", "Lagos", "Shanghai", "Tokyo", "London"]
	# 	end
	# end

end
