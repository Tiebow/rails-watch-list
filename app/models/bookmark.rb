class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie

  validates :movie, uniqueness: { scope: :list }
  validates_length_of :comment, minimum: 6
end
