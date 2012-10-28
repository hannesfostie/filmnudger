class RemindersController < ApplicationController
  def new

  end

  def create
    if current_user
      # logged in, create reminder
    else
      # show login/registration form
    end
  end
end
