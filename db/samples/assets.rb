Spree::Sample.load_sample("products")
Spree::Sample.load_sample("variants")

def create_image_pool
  images_path = Pathname.new(File.dirname(__FILE__)) + "images"
  Dir.glob(File.join(images_path, '**/*.*')).reduce([]) do |image_pool, path|
    image_pool.push(File.open(path))
  end
end

image_pool = create_image_pool

Spree::Product.all.each do |product|
  product.master.images.create!({ attachment: image_pool.sample })
end

