class FashionsController < ApplicationController
  before_action :authenticate_user!
  PER = 4
  def new
    @fashion = Fashion.new
  end

  def create
    @fashion = current_user.fashions.build(fashion_params)
   if @fashion.save
    redirect_to fashions_path
   else
    render :new
   end
  end

  def index
    @q = Fashion.ransack(params[:q]) # 検索オブジェクト作成
    @fashions = @q.result.includes(:user).order(created_at: :desc).page(params[:page]).per(PER)
    @all_ranks = Fashion.find(Like.group(:fashion_id).order('count(fashion_id) desc').limit(3).pluck(:fashion_id))
    @a = 0
  end

  def show
    @fashion = Fashion.find(params[:id])
  end

  def edit
  end

  def destroy
    @fashion = current_user.fashions.find(params[:id])
    @fashion.destroy!
    redirect_to fashions_path
  end

  private

    def fashion_params
        # images:[]とすることで、JSON形式でparamsを受け取る
        params.require(:fashion).permit(:title, :body, :shop, {pic: []})
    end
end
