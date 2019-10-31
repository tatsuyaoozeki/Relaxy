class StaffsController < ApplicationController
  before_action :set_staff, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show]

  def index
    @staffs = Staff.all
  end

  def new
    # @staff = current_user.staff.build
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
    @staff.destory
    redirect_to staffs_path, notice: "スタッフ情報を削除しました"
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
end
