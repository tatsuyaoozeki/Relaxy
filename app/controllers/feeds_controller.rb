class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy]

  def index
    @feeds = Feed.all
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
    @feed = Feed.new(feed_params)
    if @feed.save
      redirect_to feeds_path, notice: 'メニューを作成しました'
    else
      render :new
    end
  end

  def update
    if @feed.update(feed_params)
      redirect_to @feed, notice: 'メニューを編集しました'
    else
      render :edit
    end
  end

  def destroy
    @feed.destroy
    redirect_to @feed, notice: 'メニューを削除しました'
  end


  private

  def set_feed
    @feed = Feed.find(params[:id])
  end

  def feed_params
    params.require(:feed).permit(:title, :content, :image, :image_cache)
  end
end
