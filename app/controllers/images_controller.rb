class ImagesController < ActionController::Base
  def index
    @image = Image.new
  end

  def create
    img = Image.create!(image_params)
    redirect_to image_path(img.id)
  end

  def show
    @image = Image.find(params[:id])
  end

  private

  def image_params
    params.require(:image).permit(:link)
  end
end
