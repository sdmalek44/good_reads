require 'rails_helper'

describe 'when user visits /books' do
  it 'sees all of the book titles as links' do
    book1 = Book.create!(title: 'bob')
    book2 = Book.create!(title: 'abe')

    visit books_path

    expect(page).to have_content(book1.title)
    expect(page).to have_content(book2.title)
  end
  it 'can go to show page by clicking on book title' do
    book = Book.create!(title: 'bob')

    visit books_path

    click_on book.title

    expect(current_path).to eq(book_path(book))
  end
end
