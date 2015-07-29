taxonomies = [
  { name: '薬効分類'},
  { name: '先発品/後発品' },
  { name: '割引医薬品' }
]
taxonomies.each do |taxonomy_attrs|
  Spree::Taxonomy.create!(taxonomy_attrs)
end
