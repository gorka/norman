class ViewsController < ApplicationController
  def show
    @view = authorize View.find(params[:id])
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

  private

    def view_params
      params.require(:view).permit(:date, :rating, :comment).merge(user_id: current_user.id)
    end
end
