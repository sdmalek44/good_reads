class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @users = @book.users
    @average_rating = @book.average_rating
    @highest_rating = @users.highest_rating
  end
end
