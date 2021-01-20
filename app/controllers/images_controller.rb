class ImagesController < ActionController::Base
  def index
    @all_tags = ActsAsTaggableOn::Tag.all.map(&:name)
    @query_param_tag = params[:tag]
    @images = if params.key?(:tag)
                Image.tagged_with([@query_param_tag], any: true).order(created_at: :desc)
              else
                Image.order(created_at: :desc)
              end
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

  def destroy
    Image.find(params[:id]).destroy
    redirect_to images_path
  end

  private

  def image_params
    params.require(:image).permit(:link, :tag_list)
  end
end
