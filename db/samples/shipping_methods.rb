begin
  japan = Spree::Zone.first
rescue ActiveRecord::RecordNotFound
  puts "Couldn't find zone. Did you run `rake db:seed` first?"
  puts "That task will set up the countries, states and zones required for Spree."
  exit
end

shipping_category = Spree::ShippingCategory.first

Spree::ShippingMethod.create!(
  name:                "宅急便",
  zones:               [japan],
  calculator:          Spree::Calculator::Shipping::FlatRate.create!,
  shipping_categories: [shipping_category]
)

shipping_method = Spree::ShippingMethod.first
shipping_method.calculator.preferences = {
  amount:   500,
  currency: "JPY"
}
shipping_method.calculator.save!
shipping_method.save!

