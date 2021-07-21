class FashionsController < ApplicationController
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
    @fashions = Fashion.all.includes(:user).order(created_at: :desc)
  end

  private

    def fashion_params
        # images:[]とすることで、JSON形式でparamsを受け取る
        params.require(:fashion).permit(:title, :body, :shop, {pic: []})
    end
end
