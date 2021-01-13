class ImagesController < ActionController::Base
  def index
    @image = Image.new
  end
end
