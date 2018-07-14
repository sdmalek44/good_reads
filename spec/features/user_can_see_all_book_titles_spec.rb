require 'rails_helper'


describe 'when a user visits /books' do
  it 'can see a list of books' do
    book1 = Book.create!(title: 'the')
    book2 = Book.create!(title: 'cat')

    visit books_path

    expect(page).to have_content(book1.title, book2.title)
  end
  it 'each book title is link to show page' do
    book1 = Book.create!(title: 'the')
    book2 = Book.create!(title: 'cat')

    visit books_path

    click_on book1.title

    expect(current_path).to eq(book_path(book1))
  end
end
