japan = Spree::Zone.find_by_name!("日本")
consumption_tax = Spree::TaxCategory.first
tax_rate = Spree::TaxRate.create(
  name: "全国共通",
  zone: japan,
  amount: 0.08,
  tax_category: consumption_tax)
tax_rate.calculator = Spree::Calculator::DefaultTax.create!
tax_rate.save!
