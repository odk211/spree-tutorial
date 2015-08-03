Spree::Address.class_eval do
  def state_text
    state.try(:name) || state.try(:abbr) || state_name
  end

  def full_name
    "#{lastname} #{firstname}".strip
  end
end
