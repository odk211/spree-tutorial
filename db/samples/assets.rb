Spree::Sample.load_sample("products")
Spree::Sample.load_sample("variants")

products = {}
products[:ror_baseball_jersey] = Spree::Product.find_by_name!("Ruby on Rails Baseball Jersey")
products[:ror_tote] = Spree::Product.find_by_name!("Ruby on Rails Tote")
products[:ror_bag] = Spree::Product.find_by_name!("Ruby on Rails Bag")
products[:ror_jr_spaghetti] = Spree::Product.find_by_name!("Ruby on Rails Jr. Spaghetti")
products[:ror_mug] = Spree::Product.find_by_name!("Ruby on Rails Mug")
products[:ror_ringer] = Spree::Product.find_by_name!("Ruby on Rails Ringer T-Shirt")
products[:ror_stein] = Spree::Product.find_by_name!("Ruby on Rails Stein")
products[:spree_baseball_jersey] = Spree::Product.find_by_name!("Spree Baseball Jersey")
products[:spree_stein] = Spree::Product.find_by_name!("Spree Stein")
products[:spree_jr_spaghetti] = Spree::Product.find_by_name!("Spree Jr. Spaghetti")
products[:spree_mug] = Spree::Product.find_by_name!("Spree Mug")
products[:spree_ringer] = Spree::Product.find_by_name!("Spree Ringer T-Shirt")
products[:spree_tote] = Spree::Product.find_by_name!("Spree Tote")
products[:spree_bag] = Spree::Product.find_by_name!("Spree Bag")
products[:ruby_baseball_jersey] = Spree::Product.find_by_name!("Ruby Baseball Jersey")
products[:apache_baseball_jersey] = Spree::Product.find_by_name!("Apache Baseball Jersey")

def image(name, type="jpeg")
  images_path = Pathname.new(File.dirname(__FILE__)) + "images"
  path = images_path + "#{name}.#{type}"
  return false if !File.exist?(path)
  File.open(path)
end

def create_image_pool
  image_pool = []
  images_path = Pathname.new(File.dirname(__FILE__)) + "images"
  Dir.glob(File.join(images_path, '**/*.*')).each do |path|
    image_pool.push(File.open(path))
  end
  image_pool
end

image_pool = create_image_pool

images = {
  products[:ror_tote].master => [
    {
      :attachment => image_pool.sample
    },
    {
      :attachment => image_pool.sample
    }
  ],
  products[:ror_bag].master => [
    {
      :attachment => image_pool.sample
    }
  ],
  products[:ror_baseball_jersey].master => [
    {
      :attachment => image_pool.sample
    },
    {
      :attachment => image_pool.sample
    }
  ],
  products[:ror_jr_spaghetti].master => [
    {
      :attachment => image_pool.sample
    }
  ],
  products[:ror_mug].master => [
    {
      :attachment => image_pool.sample
    },
    {
      :attachment => image_pool.sample
    }
  ],
  products[:ror_ringer].master => [
    {
      :attachment => image_pool.sample
    },
    {
      :attachment => image_pool.sample
    }
  ],
  products[:ror_stein].master => [
    {
      :attachment => image_pool.sample
    },
    {
      :attachment => image_pool.sample
    }
  ],
  products[:apache_baseball_jersey].master => [
    {
      :attachment => image_pool.sample
    },
  ],
  products[:ruby_baseball_jersey].master => [
    {
      :attachment => image_pool.sample
    },
  ],
  products[:spree_bag].master => [
    {
      :attachment => image_pool.sample
    },
  ],
  products[:spree_tote].master => [
    {
      :attachment => image_pool.sample
    },
    {
      :attachment => image_pool.sample
    }
  ],
  products[:spree_ringer].master => [
    {
      :attachment => image_pool.sample
    },
    {
      :attachment => image_pool.sample
    }
  ],
  products[:spree_jr_spaghetti].master => [
    {
      :attachment => image_pool.sample
    }
  ],
  products[:spree_baseball_jersey].master => [
    {
      :attachment => image_pool.sample
    },
    {
      :attachment => image_pool.sample
    }
  ],
  products[:spree_stein].master => [
    {
      :attachment => image_pool.sample
    },
    {
      :attachment => image_pool.sample
    }
  ],
  products[:spree_mug].master => [
    {
      :attachment => image_pool.sample
    },
    {
      :attachment => image_pool.sample
    }
  ],
}

products[:ror_baseball_jersey].variants.each do |variant|
  variant.images.create!(:attachment => image_pool.sample)
  variant.images.create!(:attachment => image_pool.sample)
end

images.each do |variant, attachments|
  puts "Loading images for #{variant.product.name}"
  attachments.each do |attachment|
    variant.images.create!(attachment)
  end
end

