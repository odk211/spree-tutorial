Spree::Sample.load_sample("taxonomies")

therapeutic_category = Spree::Taxonomy.find_by!(name: "薬効分類")
new_or_generic       = Spree::Taxonomy.find_by!(name: "先発品/後発品")
discounts            = Spree::Taxonomy.find_by!(name: "割引医薬品")

taxons = [
  {
    name:     "漢方薬",
    taxonomy: therapeutic_category,
    parent:   "薬効分類"
  },
  {
    name:     "先発品",
    taxonomy: new_or_generic,
    parent:   "先発品/後発品"
  },
  {
    name:     "後発品",
    taxonomy: new_or_generic,
    parent:   "先発品/後発品"
  },
  {
    name:     "30% OFF",
    taxonomy: discounts,
    parent:   "割引医薬品"
  },
  {
    name:     "35% OFF",
    taxonomy: discounts,
    parent:   "割引医薬品"
  },
  {
    name:     "40% OFF",
    taxonomy: discounts,
    parent:   "割引医薬品"
  },
  {
    name:     "50% OFF",
    taxonomy: discounts,
    parent:   "割引医薬品"
  },
  {
    name:     "70% OFF",
    taxonomy: discounts,
    parent:   "割引医薬品"
  },
  {
    name:     "80% OFF",
    taxonomy: discounts,
    parent:   "割引医薬品"
  },
  {
    name:     "85% OFF",
    taxonomy: discounts,
    parent:   "割引医薬品"
  },
  {
    name:     "90% OFF",
    taxonomy: discounts,
    parent:   "割引医薬品"
  },
  {
    name:     "95% OFF",
    taxonomy: discounts,
    parent:   "割引医薬品"
  },
  {
    name:     "固定価格販売",
    taxonomy: discounts,
    parent:   "割引医薬品"
  },
]

taxons.each do |taxon_attrs|
  if taxon_attrs[:parent]
    taxon_attrs[:parent] = Spree::Taxon.where(name: taxon_attrs[:parent]).first
  end
  Spree::Taxon.create!(taxon_attrs)
end
