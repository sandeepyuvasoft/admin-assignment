class Subject < ApplicationRecord
	belongs_to :batch
	has_many :assignments
end
