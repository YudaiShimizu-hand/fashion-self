class LikesController < ApplicationController
  before_action :set_variables
  def like
    like = current_user.likes.new(fashion_id: @fashion.id)
    like.save
  end

  def unlike
    like = current_user.likes.find_by(fashion_id: @fashion.id)
    like.destroy
  end


  private
  def set_variables
    @fashion = Fashion.find(params[:fashion_id])
    @id_name = "#like-link-#{@fashion.id}"
  end

end
