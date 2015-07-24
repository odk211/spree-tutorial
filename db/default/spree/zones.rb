japan = Spree::Zone.create!(name: "日本", description: "日本全国")
%w(JP).each do |name|
  japan.zone_members.create!(zoneable: Spree::Country.find_by!(iso: name))
end


