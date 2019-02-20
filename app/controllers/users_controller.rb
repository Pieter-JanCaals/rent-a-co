class UsersController < ApplicationController
  def become_owner
    current_user.owner = true
    current_user.save
    redirect_to animals_path
    authorize current_user
  end
end
