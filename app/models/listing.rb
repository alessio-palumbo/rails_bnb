class Listing < ApplicationRecord
  include ImageUploader::Attachment.new(:image)

  has_one :host, class_name: 'User' 
  has_many :conversations, foreign_key: 'host_id'

  geocoded_by :full_address
  after_validation :geocode

  def country
    ISO3166::Country.new(country_code.upcase)
  end

  def full_address
    "#{street_address}, #{city}, #{country.name}"
  end

  def night_fee 
    Money.new(night_fee_cents * 100, 'AUD').format
  end

  def cleaning_fee 
    Money.new(cleaning_fee_cents * 100, 'AUD').format
  end
end
