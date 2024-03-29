class UsersController < ApplicationController
  before_action :test, only: [:show, :edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  private

  def test
    @user = User.find(params[:id])
    if @user.staff == true
      if current_user.staffs.ids != @user.staffs.ids
        redirect_to user_staff_path(@user.id, @user.staffs.ids)
      end
    end
  end
end
