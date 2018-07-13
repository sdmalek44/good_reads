class User < ApplicationRecord
  validates_presence_of :review, :rating
  has_many :user_books
  has_many :users, through: :user_books

  def self.highest_rating
    maximum(:rating)
  end
end
