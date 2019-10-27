class RelationshipsController < ApplicationController
  def create
    @relationship = current_user.relationships.create(staff_id: params[:staff_id])
    @staff = Staff.find(params[:staff_id])
    # render "index.js.erb"
    redirect_to user_staff_path(user_id: current_user.id, id: @staff.id), notice: "#{@relationship.staff.user.name}さんをフォローしました"
  end

  def destroy
    @relationship = current_user.relationships.find_by(staff_id: params[:id])#.destroy
    @relationship.destroy if @relationship
    @staff = Staff.find(params[:id])
    # render "index.js.erb"
    redirect_to @staff, notice: "#{@relationshi.staff.user.name}さんをフォローを解除しました"
    # else
    #   render :show
  end
end
