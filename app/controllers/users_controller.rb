class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user_role, only: %i[index destroy]

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])

    if @user.loans.any?
      redirect_to users_path, flash: { alert: "
        If a user has an active loan request, they cannot be deleted." }
    else
      @user.destroy
      redirect_to users_path, flash: { notice: 'User has been successfully deleted.' }
    end
  end

  private

  def check_user_role
    puts 'Checking user role...'
    return if current_user&.has_role?(:admin)
    flash[:alert] = 'You do not have access to this page.'
    redirect_to root_path
  end
end