class CommentsController < ApplicationController
  before_action :set_plan

  

  def create
    # Comment.create(comment_params)
    # redirect_to "/plans/#{comment.plan.id}"
      # redirect_to @plan, notice: 'メッセージを送信しました。'
      # ここからカリキュラム
      @comment = Comment.create(comment_params)
      respond_to do |format|
        format.html { redirect_to @plan }
        format.json
      end
  end
  
  def show
    @comment = Coment.new
    @comments = @plan.commenst.includes(:user)
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :image).merge(user_id: current_user.id, plan_id: params[:plan_id])
  end

  def set_plan
    @plan = Plan.find(params[:plan_id])
  end


end
