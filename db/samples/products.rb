Spree::Sample.load_sample("tax_categories")
Spree::Sample.load_sample("shipping_categories")

require 'csv'

default_attrs = {
  available_on:      Time.zone.now,
  tax_category:      Spree::TaxCategory.first,
  shipping_category: Spree::ShippingCategory.first,
}

# I'm not sure it is needed or not.
Spree::Config[:currency] = "JPY"

table = CSV.table(File.join(Rails.root, 'db', 'samples', 'data', 'medicine200.csv'))

Spree::Product.transaction do
  table.each do |csv_row|
    row     = csv_row.to_hash
    product = Spree::Product.create!(
      default_attrs.merge(name:        row[:name],
                          price:       row[:price],
                          description: "#{row[:manufacturer]}の薬品です。有効期限は#{row[:expiration_date]}です。"))
    product.set_property("製造元", row[:manufacturer])
    product.set_property("割引率", row[:discount_rate])
    product.set_property("数量", row[:amount])
    product.set_property("有効期限", row[:expiration_date])
    product.set_property("ロット番号", row[:lot])
    product.save
  end
end
