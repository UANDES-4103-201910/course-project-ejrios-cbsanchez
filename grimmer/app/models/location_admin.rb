class LocationAdmin < ApplicationRecord
  belongs_to :adminstrator
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
