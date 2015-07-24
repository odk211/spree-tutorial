japan = Spree::Country.find_by_iso!("JP")
kanagawa = Spree::State.find_by_name!("神奈川県")

# Billing address
Spree::Address.create!(
  firstname: Faker::Name.first_name,
  lastname:  Faker::Name.last_name,
  address1:  Faker::Address.street_address,
  address2:  Faker::Address.secondary_address,
  city:      Faker::Address.city,
  state:     kanagawa,
  zipcode:   '210-0000',
  country:   japan,
  phone:     Faker::PhoneNumber.phone_number
)

# Shipping address
Spree::Address.create!(
  firstname: Faker::Name.first_name,
  lastname:  Faker::Name.last_name,
  address1:  Faker::Address.street_address,
  address2:  Faker::Address.secondary_address,
  city:      Faker::Address.city,
  state:     kanagawa,
  zipcode:   '210-0000',
  country:   japan,
  phone:     Faker::PhoneNumber.phone_number
)
