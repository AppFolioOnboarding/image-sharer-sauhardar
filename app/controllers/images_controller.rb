class ImagesController < ActionController::Base
  def create
    img = Image.create!(image_params)
    redirect_to image_path(img.id)
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  private

  def image_params
    params.require(:image).permit(:link)
  end
end
