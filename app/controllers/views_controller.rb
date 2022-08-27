class ViewsController < ApplicationController
  before_action :set_view, only: %i( show edit update destroy )

  def index
    @views = View.all.order(date: :desc, created_at: :desc)
  end

  def show
  end

  def new
    @movie = Movie.find(params[:movie_id])

    @view = authorize @movie.views.build
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @view = authorize @movie.views.new(view_params)

    if @view.save
      redirect_to view_path(@view), notice: "View added!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @view.update(view_params)
      redirect_to @view, notice: "View edited successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @view.destroy

    redirect_to root_path, status: 303, notice: "View deleted successfully."
  end

  private

    def set_view
      @view = authorize View.find(params[:id])
    end

    def view_params
      params.require(:view).permit(:date, :rating, :comment).merge(user_id: current_user&.id)
    end
end
