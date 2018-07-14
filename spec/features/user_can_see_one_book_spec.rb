require 'rails_helper'


describe 'when a user visits /books/#' do
  it 'can see a book title' do
    book = Book.create!(title: 'the')

    visit book_path(book)

    expect(page).to have_content(book.title)
  end
  it 'can see list of reviews for book with associated rating and user' do
    book = Book.create!(title: 'the')
    user1 = User.create!(name: 'dan')
    user2 = User.create!(name: 'tim')
    review1 = book.reviews.create!(body: 'good', rating: 1, user_id: user1.id)
    review2 = book.reviews.create!(body: 'good', rating: 2, user_id: user2.id)

    visit book_path(book)

    expect(page).to have_content(review1.user.name)
    expect(page).to have_content(review1.body)
    expect(page).to have_content(review1.rating)

    expect(page).to have_content(review2.user.name)
    expect(page).to have_content(review2.body)
    expect(page).to have_content(review2.rating)
  end
  it 'can see average_rating' do
    book = Book.create!(title: 'the')
    user1 = User.create!(name: 'dan')
    user2 = User.create!(name: 'tim')
    review1 = book.reviews.create!(body: 'good', rating: 1, user_id: user1.id)
    review2 = book.reviews.create!(body: 'good', rating: 2, user_id: user2.id)

    visit book_path(book)

    expect(page).to have_content("Average Rating: 1.5")
  end
  it 'can see highest_rating' do
    book = Book.create!(title: 'the')
    user1 = User.create!(name: 'dan')
    user2 = User.create!(name: 'tim')
    review1 = book.reviews.create!(body: 'good', rating: 1, user_id: user1.id)
    review2 = book.reviews.create!(body: 'good', rating: 2, user_id: user2.id)

    visit book_path(book)

    expect(page).to have_content("Highest Rating: #{review2.rating}")
  end
  it 'can see text and name hof highest rated reviewer' do
    book = Book.create!(title: 'the')
    user1 = User.create!(name: 'dan')
    user2 = User.create!(name: 'tim')
    review1 = book.reviews.create!(body: 'good', rating: 1, user_id: user1.id)
    review2 = book.reviews.create!(body: 'great', rating: 2, user_id: user2.id)

    visit book_path(book)

    within("#highest") do
      expect(page).to have_content(review2.rating)
      expect(page).to have_content(user2.name)
      expect(page).to have_content(review2.body)
    end
  end
  it 'can see highest_rating' do
    book = Book.create!(title: 'the')
    user1 = User.create!(name: 'dan')
    user2 = User.create!(name: 'tim')
    review1 = book.reviews.create!(body: 'good', rating: 1, user_id: user1.id)
    review2 = book.reviews.create!(body: 'good', rating: 2, user_id: user2.id)

    visit book_path(book)

    expect(page).to have_content("Lowest Rating: #{review1.rating}")
  end
  it 'can see the lowest rated reviewer with their info' do
    book = Book.create!(title: 'the')
    user1 = User.create!(name: 'dan')
    user2 = User.create!(name: 'tim')
    review1 = book.reviews.create!(body: 'good', rating: 1, user_id: user1.id)
    review2 = book.reviews.create!(body: 'good', rating: 2, user_id: user2.id)

    visit book_path(book)

    within("#lowest") do
      expect(page).to have_content(review1.rating)
      expect(page).to have_content(user1.name)
      expect(page).to have_content(review1.body)
    end
  end
end
