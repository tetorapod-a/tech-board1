class UsersController < ApplicationController
  
  def show
    @plans = Plan.all
    @user = User.find(params[:id])
    @newplan = Plan.all.order("id DESC")
    @alluser = User.all
    @image_count = Comment.select('image')
    # コメント数ランキング（考え方 "https://qiita.com/hitochan/items/258215ec62ead338c2eb")
    # Plan.find("いいね数の多いPlanのid")
    @plan_comment_ranking = Plan.find(Comment.group(:plan_id).order('count(plan_id) desc').limit(3).pluck(:plan_id))
    @plan_fav_ranking = Plan.find(Favorite.group(:plan_id).order("count(plan_id) desc").limit(3).pluck(:plan_id))
  end

  
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path, notice: 'ユーザー情報を更新しました。'
    else
      render :edit
    end
  end
  

  private
  def user_params
    params.require(:user).permit(:id, :name, :email, :phone)
  end
end
