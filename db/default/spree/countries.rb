require 'carmen'
Carmen.i18n_backend.locale = :ja
japan = Carmen::Country.coded("JP")
Spree::Country.create!(
  name:            japan.name,
  iso3:            japan.alpha_3_code,
  iso:             japan.alpha_2_code,
  iso_name:        japan.name.upcase,
  numcode:         japan.numeric_code,
  states_required: japan.subregions?
)
