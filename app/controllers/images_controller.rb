class ImagesController < ActionController::Base
  def index
    @images = Image.order(created_at: :desc)
  end

  def create
    tag_list = image_params[:tag_list].split(',')
    link = image_params[:link]
    img = Image.create!(link: link, tag_list: tag_list)
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
    params.require(:image).permit(:link, :tag_list)
  end
end
