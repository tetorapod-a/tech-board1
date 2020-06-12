class Plan < ApplicationRecord

  has_many :user_plans, dependent: :destroy
  has_many :users, through: :user_plans
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # has_many :usersはすでに使っているから
  has_many :fav_users, through: :favorites, source: :user


  validates :name, presence: true
  validates :limit, presence: true
  
end

