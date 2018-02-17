class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :batch
  belongs_to :course

  has_many :assigned_users, dependent: :destroy
  has_many :assignments, through: :assigned_users 
  has_many :comments, dependent: :destroy      
end
