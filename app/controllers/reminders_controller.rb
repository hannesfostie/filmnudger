class RemindersController < ApplicationController
  def new
    @reminder = Reminder.new
  end

  def create
    if current_user.present?
      redirect_to choose_country_user_path(current_user, {tmdb_id: params[:tmdb_id]})
    else
      redirect_to new_user_path({tmdb_id: params[:tmdb_id]})
    end
  end

  def index
    @reminders = current_user.reminders
  end

  def save
    movie = Movie.find_or_create_by_tmdb_id(tmdb_id: params[:tmdb_id], title: 'temp title')
    @reminder = Reminder.new(user_id: current_user.id, movie_id: movie.id)
    if @reminder.save
      flash[:notice] = "We'll email you when your movie is released in theaters!"
      redirect_to reminders_path
    else
      flash[:alert] = "Failed to save your reminder."
      redirect_to '/'
    end
  end
end
