class Course < ApplicationRecord
	has_many :batches
	has_many  :user
	accepts_nested_attributes_for :batches

end
