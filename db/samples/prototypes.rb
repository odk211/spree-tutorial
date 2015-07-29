prototypes = [
  {
    name:       "医薬品",
    properties: %w(製造元 割引率 数量 有効期限 ロット番号)
  }
]

prototypes.each do |prototype_attrs|
  prototype = Spree::Prototype.create!(name: prototype_attrs[:name])
  prototype_attrs[:properties].each do |property|
    prototype.properties << Spree::Property.where(name: property).first
  end
end
