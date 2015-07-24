Spree::Sample.load_sample("orders")

first_order = Spree::Order.find_by_number!("R123456789")
last_order = Spree::Order.find_by_number!("R987654321")

first_order.adjustments.create!(
  :amount => 0,
  :source => Spree::TaxRate.first,
  :order  => first_order,
  :label => "Tax",
  :state => "open",
  :mandatory => true)

last_order.adjustments.create!(
  :amount => 0,
  :source => Spree::TaxRate.first,
  :order  => last_order,
  :label => "Tax",
  :state => "open",
  :mandatory => true)
