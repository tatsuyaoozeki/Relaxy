class StaffsController < ApplicationController
  # before_action :set_staff, only: [:show, :edit, :update, :destroy]

  def index
    @staffs = Staff.all
  end

  def new
    @staff = Staff.new
  end

  def create
    @staff = Staff.create(staff_params)
    if @staff.save
      redirect_to user_staff_path(@user.id), notice: "スタッフ情報を登録しました"
     else
      render new_user_staff_path, notice: "失敗しました"
    end
  end

  def show
    @staff = User.find(params[:user_id])
  end

  # def edit
  #   # @staff = Staff.find(params[:id])
  # end
  #
  # def update
  #   # @staff = Staff.find(params[:id])
  #   if @staff.update(staff_params)
  #     redirect_to staffs_path, notice: "スタッフ情報を編集しました"
  #   else
  #     render :edit
  #   end
  # end
  #
  # def destroy
  #   # @staff = Staff.find(params[:id])
  #   @staff.destory
  #   redirect_to staffs_path, notice: "スタッフ情報を削除しました"
  # end


  private

  def staff_params
    params.require(:staff).permit(:content, :gender)
  end

  # def set_staff
  #   @staff = Staff.find(params[:id])
  # end
end
