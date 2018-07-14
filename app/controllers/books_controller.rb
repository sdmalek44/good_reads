class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    if @book.reviews.last
      @reviews = @book.reviews.includes(:user)
      @average_rating = @book.average_rating
      @highest_rated_review = @book.highest_rated_review
      @highest_reviewer = @highest_rated_review.user
      @lowest_rated_review = @book.lowest_rated_review
      @lowest_reviewer = @lowest_rated_review.user
    end
  end
end
