require 'rails_helper'

describe Book, type: :model do
  describe 'instance methods' do
    it 'calculates average rating' do
      book = Book.create!(title: 'bob')
      user1 = book.users.create(review: 'bad', rating: 1, name: 'bill')
      user2 = book.users.create(review: 'good', rating: 2, name: 'todd')

      expect(book.average_rating).to eq(1.5)
    end
  end
end
