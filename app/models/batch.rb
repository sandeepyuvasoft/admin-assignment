class Batch < ApplicationRecord
	belongs_to :course
	has_many  :user
	has_many :subjects
end
