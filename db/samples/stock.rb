Spree::Sample.load_sample("variants")

country         = Spree::Country.find_by(iso: 'JP')
location        = Spree::StockLocation.first_or_create!(
  name:     'とある倉庫',
  address1: 'どこか',
  city:     'ある町',
  zipcode:  '085-0467',
  country:  country,
  state:    country.states.first
)
location.active = true
location.save!

Spree::Variant.all.each do |variant|
  variant.stock_items.each do |stock_item|
    Spree::StockMovement.create(:quantity => 1, :stock_item => stock_item)
  end
end
