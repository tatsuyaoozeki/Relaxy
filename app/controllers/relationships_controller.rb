class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:followed_id])
    if current_user.follow(@user)
      redirect_to user_path(@user.id), notice: "フォローしました"
      respond_to do |format|
        format.html { redirect_to @user }
        format.js
      end
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    if current_user.unfollow(@user)
      redirect_to user_path(@user.id), notice: "フォロー解除しました"
      respond_to do |format|
        format.html { redirect_to @user }
        format.js
      end
    end
  end
end
