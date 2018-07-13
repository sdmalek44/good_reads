class Book < ApplicationRecord
  has_many :user_books
  has_many :users, through: :user_books

  def average_rating
    users.average(:rating)
  end
end
