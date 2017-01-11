class Job < ApplicationRecord
	belongs_to :user
	has_and_belongs_to_many :boats

	validates :description, uniqueness: :true
	validates_length_of :description, minimum: 50
	validates :cost, :numericality => { :greater_than => 999 }
end
