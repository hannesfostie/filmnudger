class UsersController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]

  def new
    if current_user
      redirect_to reminders_path(current_user)
    else
      @user = User.new
    end
  end

  def create
    @user = User.find_or_create_by_email(params[:email])
    if @user.new_record?
      @user.password = params[:password]
      @user.save
    end
    if @user = login(@user.email, params[:password])
      redirect_to choose_country_user_path(@user,{tmdb_id: params[:tmdb_id]})
    else
      flash.now[:alert] = 'Login failed.'
      render :action => :new
    end
  end

  def destroy
    logout
    redirect_to :root, :notice => 'Logged out!'
  end

  def edit
    @user = User.find(params[:id])
  end

  def choose_country
    @user = current_user
    if current_user.country?
      redirect_to save_reminder_path({tmdb_id: params[:tmdb_id] })
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    flash[:notice] = "Your settings were saved!"
    redirect_to :back
  end

end
