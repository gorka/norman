class ReadsController < ApplicationController
  before_action :set_book, only: %i( new create )
  before_action :set_read, only: %i( show edit update destroy )

  def index
    @reads = policy_scope(Read).order(date: :desc)
  end

  def show
  end

  def new
    @read = @book.reads.new
  end

  def create
    @read = @book.reads.new(read_params)

    if @read.save
      redirect_to read_path(@read), notice: "Read added!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @read.update(read_params)
      redirect_to @read, notice: "Read edited successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @read.destroy

    redirect_to root_path, status: 303, notice: "Read deleted successfully."
  end

  private

    def set_book
      @book = authorize Book.find(params[:book_id])
    end

    def set_read
      @read = authorize Read.find(params[:id])
    end

    def read_params
      params.require(:read).permit(:date, :rating, :comment).merge(user_id: current_user&.id)
    end
end
