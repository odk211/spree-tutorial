Spree::Sample.load_sample("tax_categories")
Spree::Sample.load_sample("shipping_categories")

default_attrs            = {
  description:       Faker::Lorem.paragraph,
  available_on:      Time.zone.now,
  tax_category:      Spree::TaxCategory.first,
  shipping_category: Spree::ShippingCategory.first,
}

# I'm not sure it is needed or not.
Spree::Config[:currency] = "JPY"

products = [
  {
    name:  "Ruby on Rails Tote",
    price: 15.99,
  },
  {
    name:  "Ruby on Rails Bag",
    price: 22.99,
  },
  {
    name:  "Ruby on Rails Baseball Jersey",
    price: 19.99,
  },
  {
    name:  "Ruby on Rails Jr. Spaghetti",
    price: 19.99,

  },
  {
    name:  "Ruby on Rails Ringer T-Shirt",
    price: 19.99,
  },
  {
    name:  "Ruby Baseball Jersey",
    price: 19.99,
  },
  {
    name:  "Apache Baseball Jersey",
    price: 19.99,
  },
  {
    name:  "Spree Baseball Jersey",
    price: 19.99,
  },
  {
    name:  "Spree Jr. Spaghetti",
    price: 19.99,
  },
  {
    name:  "Spree Ringer T-Shirt",
    price: 19.99,
  },
  {
    name:  "Spree Tote",
    price: 15.99,
  },
  {
    name:  "Spree Bag",
    price: 22.99,
  },
  {
    name:  "Ruby on Rails Mug",
    price: 13.99,
  },
  {
    name:  "Ruby on Rails Stein",
    price: 16.99,
  },
  {
    name:  "Spree Stein",
    price: 16.99,
  },
  {
    name:  "Spree Mug",
    price: 13.99,
  }
]

products.each do |product_attrs|
  Spree::Product.create!(default_attrs.merge(product_attrs))
end
