class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  def index
    @books = policy_scope(Book.all)
  end

  def show
  end

  def new
    @book = authorize Book.new
  end

  def edit
  end

  def create
    @book = authorize Book.new(book_params)

    if @book.save
      redirect_to book_url(@book), notice: "Book was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      redirect_to book_url(@book), notice: "Book was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy

    redirect_to books_url, notice: "Book was successfully destroyed."
  end

  private
    def set_book
      @book = authorize Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :subtitle, :isbn, :author, :web, :description)
    end
end
