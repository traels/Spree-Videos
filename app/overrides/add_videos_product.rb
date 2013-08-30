Deface::Override.new(:virtual_path => 'spree/products/_thumbnails',
                     :name => 'add_videos_to_products_show',
                     :insert_bottom => 'ul#product-thumbnails',
                     :sequence => 999,
                     :text => %q{ <%= render :partial => 'spree/products/video_thumb_alongside_images', :locals => { :videos => @videos } %> },
                     :disabled => false)