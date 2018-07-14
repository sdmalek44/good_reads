class Book < ApplicationRecord
  validates_presence_of :title
  has_many :reviews
  has_many :users, through: :reviews

  def average_rating
    reviews.average(:rating)
  end

  def highest_rating
    reviews.maximum(:rating)
  end

  def highest_rated_review
    reviews.find_by(rating: highest_rating)
  end

  def lowest_rated_review
    reviews.order(:rating).first
  end
end
