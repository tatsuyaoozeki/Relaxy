class RelationshipsController < ApplicationController
  def create
    @favorite = current_user.favorites.create(staff_id: params[:staff_id])
    @staff = staff.find(params[:staff_id])
    render "index.js.erb"
  end

  def destroy
    @favorite = current_user.favorites.find_by(staff_id: params[:id]).destroy
    @staff = staff.find(params[:id])
    render "index.js.erb"
  end
end
