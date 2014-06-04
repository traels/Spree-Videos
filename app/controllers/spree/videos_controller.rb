module Spree
  class VideosController < BaseController
    respond_to :html

    def index
      @videos = Video.all(:joins => :product, :conditions => 'spree_products.deleted_at is NULL')
    end

    def product_index
      @product = Product.active(current_currency).friendly.find_by_param(params[:product_id])
      puts @product
      @videos = @product.videos.all(:order => 'position')
    end

    def show
      video = Video.find(params[:id])
      client = YouTubeIt::Client.new
    end
  end
end
