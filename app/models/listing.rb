class Listing < ApplicationRecord
  include ImageUploader::Attachment.new(:image)

  # , foreign_key: 'host_id', class_name: 'User'
  belongs_to :host, class_name: 'User' 
  has_many :conversations

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
