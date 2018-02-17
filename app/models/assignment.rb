class Assignment < ApplicationRecord
	belongs_to :subject
	has_many :assigned_users, dependent: :destroy
  has_many :users, through: :assigned_users
  has_many :comments, dependent: :destroy
end
