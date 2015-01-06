class ListsController < ApplicationController

  before_action :authenticate_user!
  def show
    @lists = current_user.list
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params.require(:list).permit(:title, :item))
    if @list.save
      flash[:notice] = "List was saved."
      redirect_to @list
    else
      flash[:error] = "There was an error saving the list. Please create another one."
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update_attributes(params.require(:list).permit(:title, :item))
      flash[:notice] = "List was updated."
      redirect_to @list
    else
      flash[:error] = "There was an error saving the List. Please try again."
      render :edit
    end
  end
end
