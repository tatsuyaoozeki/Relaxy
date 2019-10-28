class FeedsController < ApplicationController
  before_action :set_feed, only:[:show, :edit, :update, :destroy]
  def index
    @feeds = Feed.all
  end

  def new
    @feed = Feed.new
  end

  def create
    @feed = Feed.new(feed_params)
    if @feed.save
      redirect_to new_feed_path, notice:"投稿を作成しました"
    else
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @feed.update(feed_params)
      redirect_to feed_path(@feed.id), notice: "編集しました"
    else
      render :edit
    end
  end

  def destroy
    @fedd.destroy
    redirect_to feed_path(@feed.id), notice: "削除しました"
  end

  private

  def feed_params
    params.require(:feed).permit(:name, :content, :image, :image_cache, :staff_id)
  end

  def set_feed
    @feed = Feed.find(params[:id])
  end
end
