class Project < ApplicationRecord
	validates :name, presence: true
	
	has_many :books, dependent: :destroy
end
