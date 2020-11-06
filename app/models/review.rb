class Review < ApplicationRecord
  belongs_to :movie

  validates :name, presence: true

  STARS = [1,2,3,4,5]
  validates :stars, inclusion: {
    in: STARS,
    message: "Must be bewtween 1 and 5"
  }

  validates :comment, length: { minimum: 4}
end
