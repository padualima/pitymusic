class Artist < ApplicationRecord
  #associations
  has_many :albums
  has_one_attached :photo

  #validates
  validates :name, presence: true
end
