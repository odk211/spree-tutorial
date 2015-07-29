begin
  japan = Spree::Zone.first!
rescue ActiveRecord::RecordNotFound
  puts "Couldn't find zone. Did you run `rake db:seed` first?"
  puts "That task will set up the countries, states and zones required for Spree."
  exit
end

shipping_category = Spree::ShippingCategory.first

Spree::ShippingMethod.create!(
  name:                "配送",
  zones:               [japan],
  calculator:          Spree::Calculator::Shipping::FlatRate.create!,
  shipping_categories: [shipping_category]
)

Spree::ShippingMethod.create!(
  name:                "とりおき",
  zones:               [japan],
  calculator:          Spree::Calculator::Shipping::FlatRate.create!,
  shipping_categories: [shipping_category]
)

# TODO free when order total fee is over 15000 yen.
Spree::ShippingMethod.all.each do |shipping_method|
  shipping_method.calculator.preferences = {
    amount:   500,
    currency: "JPY"
  }
  shipping_method.calculator.save!
  shipping_method.save!
end

