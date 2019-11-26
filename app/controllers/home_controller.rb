class HomeController < ApplicationController
  def index
    @feeds = Feed.all.reverse
  end

  def mypage
  end
end
