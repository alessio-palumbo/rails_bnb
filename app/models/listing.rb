class Listing < ApplicationRecord
  geocoded_by :full_address
  after_validation :geocode

  monetize :night_fee_cents, :cleaning_fee_cents


  def country
    ISO3166::Country.new(country_code.upcase)
  end

  def full_address
    "#{street_address}, #{city}, #{country.name}"
  end

  def night_fee 
    Money.new(night_fee_cents, 'AUD').format
  end
  

  def cleaning_fee 
    Money.new(cleaning_fee_cents, 'AUD').format
  end
end
