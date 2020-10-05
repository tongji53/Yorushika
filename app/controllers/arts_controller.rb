class ArtsController < ApplicationController
  before_action :set_art, only: %i[show edit update destroy]

  def index
    @arts = Art.order(id: :asc)
  end

  def show
  end

  def new
    @art = Art.new
  end

  def create
    @art = Art.new(art_params)
    if @art.save
      redirect_to arts_path, notice: "投稿しました"
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def edit
  end

  def update
    if @art.update(art_params)
      redirect_to @art, notice: "変更しました"
    else
      flash.now[:alert] = "変更に失敗しました"
      render :edit
    end 
  end

  def destroy
    @art.destroy
    redirect_to arts_path, alert: "削除しました"
  end

  private

  def set_art
    @art = Art.find(params[:id])
  end

  def art_params
    params.require(:art).permit(:title, :content)
  end
end
