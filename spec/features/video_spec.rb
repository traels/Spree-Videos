require 'spec_helper'

describe 'video display' do
  before :each do
    @product = create :product, :name => "The Product"
    image = File.open(File.expand_path('../../fixtures/thinking-cat.jpg', __FILE__))
    @product.images.create!(:attachment => image)
    @product.images.create!(:attachment => image)
  end
  let(:product) { @product }

  it "should display no video player when no videos exist" do
    visit spree.product_path(product)
    page.should_not have_css('a.youtube')
  end

  it "should display a video thumbnail on product page" do
    v = product.videos.build
    v.youtube_ref = 'iJ4T9CQA0UM'
    v.save!

    visit spree.product_path(product)

    page.should have_css('a.youtube', count: 1)
  end

  it "should display a player with multiple thumbnails when multiple thumbnails exist" do
    v = product.videos.build
    v.youtube_ref = 'iJ4T9CQA0UM'
    v.save!

    v = product.videos.build
    v.youtube_ref = 'hntXAO_Rq7c'
    v.save!

    visit spree.product_path(product)

    page.should have_css('a.youtube', count: 2)
  end
end
