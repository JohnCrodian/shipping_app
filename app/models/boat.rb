class Boat < ApplicationRecord
	belongs_to :user
	has_and_belongs_to_many :jobs
	has_attached_file :avatar, styles: { medium: "300x300>", small: "100x100>" }, default_url: "/images/:style/missing.png"


	validates :name, uniqueness: true
	validates_attachment_content_type :avatar,
        :content_type => /\Aimage\/.*\Z/

end
