require 'rails_helper'

describe 'user visits /books/#' do
  it 'can see a list of reviews for that book' do
    book = Book.create!(title: 'bob')
    user1 = book.users.create(review: 'bad', rating: 1, name: 'bill')
    user2 = book.users.create(review: 'good', rating: 2, name: 'todd')

    visit book_path(book)

    expect(page).to have_content(user1.name, user2.name)
    expect(page).to have_content(user1.review, user1.rating)
    expect(page).to have_content(user2.review, user2.rating)
  end
  it 'can see average rating' do
    book = Book.create!(title: 'bob')
    user1 = book.users.create(review: 'bad', rating: 1, name: 'bill')
    user2 = book.users.create(review: 'good', rating: 2, name: 'todd')

    visit book_path(book)

    expect(page).to have_content("Average Rating: 1.5")
  end
end
