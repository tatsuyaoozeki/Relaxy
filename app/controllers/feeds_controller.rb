class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @feeds = Feed.all.reverse
  end

  def show
  end


  def new
    @feed = Feed.new
  end

  def edit
  end

  def create
    @feed = current_user.feeds.build(feed_params)
    if @feed.save
      redirect_to feeds_path, notice: '投稿を作成しました'
    else
      render :new
    end
  end

  def update
    if @feed.update(feed_params)
      redirect_to feeds_path, notice: '投稿を編集しました'
    else
      render :edit
    end
  end

  def destroy
    @feed.destroy
    redirect_to @feed, notice: '投稿を削除しました'
  end


  private

  def set_feed
    @feed = Feed.find(params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end

  def feed_params
    params.require(:feed).permit(:title, :content, :image, :image_cache)
  end

  def ensure_correct_user
  @feed = Feed.find_by(id: params[:id])
    if current_user.id != @feed.user_id
      redirect_to feeds_path
    end
  end


end
