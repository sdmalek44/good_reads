class Review < ApplicationRecord
  validates_presence_of :body, :rating
  belongs_to :book
  belongs_to :user
end
