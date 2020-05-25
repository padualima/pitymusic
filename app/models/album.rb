class Album < ApplicationRecord
  #associations
  belongs_to :category
  belongs_to :artist

  has_many :songs
  has_one_attached :file

  #validates 
  validates :title, presence: true
  validates :date, presence: true
end
