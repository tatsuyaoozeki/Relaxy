class StaffsController < ApplicationController
  before_action :set_staff, only: [:show, :edit, :update, :destroy]

  def index
    @staffs = Staff.all
  end

  def new
    # @staff = current_user.staff.build
    @staff = Staff.new
  end

  def create
    # @staff = Staff.new(staff_params)
    @staff = current_user.staffs.build(staff_params)
    if @staff.save
      redirect_to user_staff_path(user_id: current_user.id, id: @staff.id), notice: "スタッフ情報を登録しました"
     else
      render :new, notice: "失敗しました"
    end
  end

  def show
    # @staff = User.find(params[:user_id])
    # @staff = Staff.find(params[:id])
    @relationship = current_user.relationships.find_by(staff_id: @staff.id)
  end

  def edit
    # @staff = Staff.find(params[:id])
  end

  def update
    # @staff = Staff.find(params[:id])
    if @staff.update(staff_params)
      redirect_to user_staff_path(user_id: current_user.id, id: @staff.id), notice: "スタッフ情報を編集しました"
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
    params.require(:staff).permit(:content, :gender, :user_id)
  end

  def set_staff
    @staff = Staff.find(params[:id])
  end
end
