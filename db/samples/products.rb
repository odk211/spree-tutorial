Spree::Sample.load_sample("tax_categories")
Spree::Sample.load_sample("shipping_categories")
Spree::Sample.load_sample("taxons")

require 'csv'

default_attrs            = {
  available_on:      Time.zone.now,
  tax_category:      Spree::TaxCategory.first,
  shipping_category: Spree::ShippingCategory.first,
}

# I'm not sure it is needed or not.
Spree::Config[:currency] = "JPY"

table = CSV.table(File.join(Rails.root, 'db', 'samples', 'data', 'medicine200.csv'))

discount_rate_taxons = {
  :'30%'    => Spree::Taxon.where(name: "30% OFF").first,
  :'35%'    => Spree::Taxon.where(name: "35% OFF").first,
  :'40%'    => Spree::Taxon.where(name: "40% OFF").first,
  :'50%'    => Spree::Taxon.where(name: "50% OFF").first,
  :'70%'    => Spree::Taxon.where(name: "70% OFF").first,
  :'80%'    => Spree::Taxon.where(name: "80% OFF").first,
  :'85%'    => Spree::Taxon.where(name: "85% OFF").first,
  :'90%'    => Spree::Taxon.where(name: "90% OFF").first,
  :'95%'    => Spree::Taxon.where(name: "95% OFF").first,
  :'固定価格販売' => Spree::Taxon.where(name: "固定価格販売").first
}

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
    product.save!
    discount_rate_taxons[row[:discount_rate].to_sym].products << product
  end
  discount_rate_taxons.values do |taxon|
    taxon.save!
  end
end
