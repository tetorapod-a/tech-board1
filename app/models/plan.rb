class Plan < ApplicationRecord

  has_many :user_plans
  has_many :users, through: :user_plans

  validates :name, presence: true
end

