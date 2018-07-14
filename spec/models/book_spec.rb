require 'rails_helper'


describe Book, type: :model do
  it 'can calculate average_rating' do
    book = Book.create!(title: 'the')
    user1 = User.create!(name: 'dan')
    user2 = User.create!(name: 'tim')
    review1 = book.reviews.create!(body: 'good', rating: 1, user_id: user1.id)
    review2 = book.reviews.create!(body: 'good', rating: 2, user_id: user2.id)

    expect(book.average_rating).to eq(1.5)
  end
  it 'can calculate highest_rating' do
    book = Book.create!(title: 'the')
    user1 = User.create!(name: 'dan')
    user2 = User.create!(name: 'tim')
    review1 = book.reviews.create!(body: 'good', rating: 1, user_id: user1.id)
    review2 = book.reviews.create!(body: 'good', rating: 2, user_id: user2.id)

    expect(book.highest_rating).to eq(2)
  end
  it 'can calculate highest_rated review' do
    book = Book.create!(title: 'the')
    user1 = User.create!(name: 'dan')
    user2 = User.create!(name: 'tim')
    review1 = book.reviews.create!(body: 'good', rating: 1, user_id: user1.id)
    review2 = book.reviews.create!(body: 'good', rating: 2, user_id: user2.id)

    expect(book.highest_rated_review.rating).to eq(2)
  end
  it 'can calculate lowest_rated review' do
    book = Book.create!(title: 'the')
    user1 = User.create!(name: 'dan')
    user2 = User.create!(name: 'tim')
    review1 = book.reviews.create!(body: 'good', rating: 1, user_id: user1.id)
    review2 = book.reviews.create!(body: 'good', rating: 2, user_id: user2.id)

    expect(book.lowest_rated_review.rating).to eq(1)
  end
end
