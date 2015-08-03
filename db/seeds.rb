# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

def extract_options_from_env(env_prefix)
  ENV.select { |k, v| (k.start_with? env_prefix) && v.present? }.
    reduce({}) do |options, (k, v)|
    options.store(k.split(env_prefix)[1].downcase.to_sym, v)
    options
  end
end

Spree.config do |config|
  config.company = true
  config.currency = 'JPY'
  config.show_variant_full_price = true
  config.default_country_id = Spree::Country.find_by(iso: "JP").id
  # config.binary_inventory_cache = false
  # config.track_inventory_levels = false

  # Spree mail settings
  config.set(extract_options_from_env('APP_MAIL_OPTIONS_'))
end
