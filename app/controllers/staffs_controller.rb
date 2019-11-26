class StaffsController < ApplicationController
  before_action :set_staff, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show]
  # before_action :set_menu, only: [:show]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @staffs = Staff.all

  end

  def new
    @staff = Staff.new
  end

  def create
    @staff = Staff.new(staff_params)
    @staff.user_id = current_user.id
    if @staff.save
      redirect_to staff_path(@staff.id), notice: "スタッフ情報を登録しました"
    else
      render :new, notice: "失敗しました"
    end
  end

  def show
    @menus = Menu.where(user_id: @staff.id)
  end

  def edit
  end

  def update
    if @staff.update(staff_params)
      redirect_to staff_path(@staff.id), notice: "スタッフ情報を編集しました"
    else
      render :edit
    end
  end

  def destroy
    # @staff = Staff.find(params[:id])
    @staff.destrory
    redirect_to staffs_path, notice: "スタッフ情報を削除しました"
  end

  def following
      @user  = User.find(params[:id])
      @users = @user.followings
      render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  private

  def staff_params
    params.require(:staff).permit(:content, :gender)
  end

  def set_staff
    @staff = Staff.find(params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end

  # def set_menu
  #   @menu = Menu.find(params[:id])
  # end

  def ensure_correct_user
  @staff = Staff.find_by(id: params[:id])
    if @staff.user_id != current_user.id
      flash[:notice] = "権限がありません"
      redirect_to staffs_path
    end
  end
end
