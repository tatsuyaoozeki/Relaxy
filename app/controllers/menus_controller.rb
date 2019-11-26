class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @menus = Menu.all.reverse
    @params = params[:q]
    @search = Menu.ransack(@params)
    @result = @search.result(distinct: true)
  end

  def show
    
  end

  def new
    @menu = Menu.new
  end

  def edit
  end

  def create
    @menu = current_user.menus.build(menu_params)
    if @menu.save
      redirect_to menus_path, notice: 'メニューを作成しました'
    else
      render :new
    end
  end

  def update
    if @menu.update(menu_params)
      redirect_to @menu, notice: 'メニューを編集しました'
    else
      render :edit
    end
  end

  def destroy
    @menu.destroy
    redirect_to @menu, notice: 'メニューを削除しました'
  end

  private

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def menu_params
    params.require(:menu).permit(:menu_name, :time_require, :price, :menu_content)
  end

  def ensure_correct_user
  @menu = Menu.find_by(id: params[:id])
    if current_user.id != @menu.user_id
      redirect_to menus_path
    end
  end
end
