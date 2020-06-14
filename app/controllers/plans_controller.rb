class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy]
  before_action :move_to_new_session, except: [:index, :show]
  
  def all 
  @plans = Plan.all
  @newplan = Plan.all.order("id DESC")

  end

  # GET /plans
  # GET /plans.json
  def index
    @plans = Plan.all
    @newplan = Plan.all.order("id DESC")

    
  end

  # GET /plans/1
  # GET /plans/1.json
  def show
    @comment = Comment.new
    @comments = @plan.comments.includes(:user)
    @favorites =Favorite.new
  end

  # GET /plans/new
  def new
    @plan = Plan.new
    @plan.users << current_user
  end

  # GET /plans/1/edit
  def edit
  end

  # POST /plans
  # POST /plans.json
  def create

    @plan = Plan.new(plan_params)
    

    respond_to do |format|
      if @plan.save(plan_params)
        format.html { redirect_to @plan, notice: '新しい現場が登録されました。' }
        format.json { render :show, status: :created, location: @plan }
      else
        format.html { render :new }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plans/1
  # PATCH/PUT /plans/1.json
  def update
    respond_to do |format|
      if @plan.update(plan_params)
        format.html { redirect_to @plan, notice: '変更を更新しました.' }
        format.json { render :show, status: :ok, location: @plan }
      else
        format.html { render :edit }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    @plan.destroy
    respond_to do |format|
      format.html { redirect_to plans_url, notice: 'Plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plan_params
      params.require(:plan).permit(:name, :start, :end, :place, :place_url, :client, :body1, :body2, :body3, :body4, :detail, :limit, user_ids: [])
    end

    def move_to_new_session
      redirect_to new_user_session_path unless user_signed_in?
    end

end
