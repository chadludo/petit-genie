class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    @list.save!

    redirect_to profiles_path
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @list.update(list_params)
    redirect_to profiles_path(@profile)
  end

  def destroy
    @list.destroy
    redirect_to profiles_path(@profile)
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title, :birth_date, :picture)
  end
end
