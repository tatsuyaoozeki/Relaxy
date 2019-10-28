class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  # GET /menus
  # GET /menus.json
  def index
    @menus = Menu.all
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
  end

  # GET /menus/new
  def new
    @menu = Menu.new
  end

  # GET /menus/1/edit
  def edit
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to @menu, notice: 'メニューを作成しました'
      # format.html { redirect_to @menu, notice: 'Menu was successfully created.' }
      # format.json { render :show, status: :created, location: @menu }
    else
      render :new
      # format.html { render :new }
      # format.json { render json: @menu.errors, status: :unprocessable_entity }
    end
  end


  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    if @menu.update(menu_params)
      redirect_to @menu, notice: 'メニューを編集しました'
      # format.json { render :show, status: :ok, location: @menu }
    else
      render :edit
      # format.html { render :edit }
      # format.json { render json: @menu.errors, status: :unprocessable_entity }
    end
  end


  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu.destroy
    redirect_to @menu, notice: 'メニューを削除しました'
    # respond_to do |format|
    #   format.html { redirect_to menus_url, notice: 'Menu was successfully destroyed.' }
    #   format.json { head :no_content }
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_menu
    @menu = Menu.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def menu_params
    params.require(:menu).permit(:menu_name, :time_require, :price, :menu_content, :staff_id)
  end
end
