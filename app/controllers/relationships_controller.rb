class RelationshipsController < ApplicationController

  # def create
  #   @relationship = current_user.relationships.create(staff_id: params[:staff_id])
  #   @staff = Staff.find(params[:staff_id])
  #   # render "index.js.erb"
  #   redirect_to staff_path(user_id: current_user.id, id: @staff.id), notice: "#{@relationship.staff.user.name}さんをフォローしました"
  # end
  #
  # def destroy
  #   @relationship = current_user.relationship.find_by(staff_id: params[:id]).destroy
  #   # @relationship.destroy if @relationship
  #   @relationship = current_user.relationships.find_by(staff_id: params[:id])#.destroy
  #   @relationship.destroy if @relationship
  #   @staff = Staff.find(params[:id])
  #   # render "index.js.erb"
  #   redirect_to @staff, notice: "#{@relationshi.staff.user.name}さんをフォローを解除しました"
  # end

  def create
    @user = User.find(params[:relationship][:following_id])
    current_user.follow!(@user)
    redirect_to staff_path(@user.staff.id)
  end

  def destroy
    @user = Relationship.find(params[:id]).following
    current_user.unfollow!(@user)
    redirect_to staff_path(@user.staff.id)
  end
end
