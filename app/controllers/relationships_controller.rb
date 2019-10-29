class RelationshipsController < ApplicationController

  def create
    @follow = current_user.following.create(staff_id: params[:staff_id])
    @staff = Staff.find(params[:staff_id])
    render "index.js.erb"
  end

  def destroy
    @follow = current_user.following.find_by(staff_id: params[:id]).destroy
    @staff = Staff.find(params[:id])
    render "index.js.erb"
  end
end
