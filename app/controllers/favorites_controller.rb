class FavoritesController < ApplicationController
  before_action :set_plan, only: [:create, :destroy]


  def create
    @favorite = current_user.favorites.create(plan_id: params[:plan_id])
    redirect_to @plan, notice: 'お気に入りに追加しました。'
  end

  def  destroy
    @favorite = Favorite.find_by(plan_id: params[:plan_id], user_id: current_user.id)
    @favorite.destroy
    redirect_to @plan, notice: 'お気に入りから削除しました。'
  end

  private
  def set_plan
    @plan = Plan.find(params[:plan_id])
  end


end
