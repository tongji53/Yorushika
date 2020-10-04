class ArtsController < ApplicationController
  def index
    @arts = Art.order(id: :asc)
  end

  def new
    @art = Art.new
  end

  def create
    @art = Art.new(art_params)
    if @art.save
      redirect_to arts_path
    end
  end

  private

  def art_params
    params.require(:art).permit(:title, :content)
  end
end
