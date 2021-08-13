class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_and_belongs_to_many :movies, through: :bookmarks

  validates :name, presence: true, uniqueness: true
end
