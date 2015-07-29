Spree::Sample.load_sample("variants")

country = Spree::Country.find_by(iso: 'JP')
state   = Spree::State.find_by(name: '神奈川県')

location = Spree::StockLocation.first_or_create!(
  name:     '横須賀医薬品物流センター',
  address1: '船越町1-12',
  city:     '横須賀市',
  zipcode:  '237-0076',
  phone:    '123-123-1231',
  country:  country,
  state:    state
)
location.active = true
location.save!

Spree::Variant.all.each do |variant|
  variant.stock_items.each do |stock_item|
    Spree::StockMovement.create(:quantity => 1, :stock_item => stock_item)
  end
end
