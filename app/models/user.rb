class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_plans
  has_many :plans, through: :user_plans
  has_many :comments
  has_many :favorites
  has_many :fav_plans, through: :favorites, source: :plan
  
  validates :name, presence: true

  def already_favorited?(plan)
    favorites.exists?(plan_id: plan.id)
  end


end
