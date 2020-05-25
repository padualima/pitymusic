class Song < ApplicationRecord
  #associations
  belongs_to :album
  has_many_attached :file

  #validates
  validates :title, presence: true
end
