class TagSearchesController < ApplicationController
  def search
    @model = Book
    @word = params[:word]
    @books = Book.where("tag LIKE?","%#{@word}%")
    books = @books
    render "searches/result"
  end
end
