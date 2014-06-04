require 'spec_helper'

describe 'admin functionality', js: false do
  before :each do
    user = create(:admin_user, :email => "admin@person.com", :password => "password", :password_confirmation => "password")
    sign_in_admin!(user)
    @product = create :product, :name => "The Product"
  end

  let(:product) { @product }

  it "should properly add a video to a product" do
    visit spree.new_admin_product_video_path(product)
    fill_in 'video_youtube_ref', :with => 'hntXAO_Rq7c'
    click_button 'Update'

    page.should have_text('Video has been successfully created!')
    page.should have_text('hntXAO_Rq7c')
  end
end
