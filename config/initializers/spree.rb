# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# Note: If a preference is set here it will be stored within the cache & database upon initialization.
#       Just removing an entry from this initializer will not make the preference value go away.
#       Instead you must either set a new value or remove entry, clear cache, and remove database entry.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  # Example:
  # Uncomment to stop tracking inventory levels in the application
  # config.track_inventory_levels = false
  config.company = true
  config.currency = 'JPY'
  #config.binary_inventory_cache = false
  config.default_country_id = 1
  config.show_variant_full_price = true
  # config.track_inventory_levels = false
end

Spree.user_class = "Spree::User"

attachment_config = {
  styles:        {
    mini:    "48x48>",
    small:   "100x100>",
    product: "240x240>",
    large:   "600x600>"
  },
  default_style: "product"
}

if ENV['AWS_ACCESS_KEY_ID'].present?
  # S3 image upload settings
  attachment_config.merge! ({
                             s3_credentials: {
                               access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
                               secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
                               bucket:            ENV['S3_BUCKET_NAME'],
                               s3_host_name:      ENV['S3_HOST_NAME']
                             },
                             storage:        :s3,
                             s3_headers:     { "Cache-Control" => "max-age=31557600" },
                             s3_protocol:    "https",
                             path:           "/:class/:id/:style/:basename.:extension",
                             default_url:    "/:class/:id/:style/:basename.:extension",
                             bucket:         ENV['S3_BUCKET_NAME']
                           })
else
  attachment_config.merge! ({
                             storage: :filesystem
                           })
end

attachment_config.each do |key, value|
  Spree::Image.attachment_definitions[:attachment][key.to_sym] = value
end
