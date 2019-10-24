class RelationshipsController < ApplicationController
  def create
    @relationship = current_user.relationships.create(staff_id: params[:staff_id])
    @staff = Staff.find(params[:staff_id])
    # render "index.js.erb"
    redirect_to @staff, notice: "#{@relationship.staff.user.name}さんをフォローしました"
  end

  def destroy
    @relationship = current_user.relationships.find_by(staff_id: params[:id]).destroy
    @staff = Staff.find(params[:id])
    # render "index.js.erb"
    redirect_to @staff, notice: "#{@relationship.staff.user.name}さんをフォローを解除しました"
  end
end
