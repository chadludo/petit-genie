class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save

    # no need for app/views/restaurants/create.html.erb
    redirect_to profiles_path
  end

  def edit
    @list = List.find(params[:id])
  end

  def destroy

  end

  private

  def list_params
    params.require(:list).permit(:title, :birth_date)
  end
end
