class ListsController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @lists = current_user.lists
  end

  def show
    @list = List.find(params[:id])
    @items = @list.items
  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.build(list_params)
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
    if @list.update_attributes(list_params)
      flash[:notice] = "List was updated."
      redirect_to @list
    else
      flash[:error] = "There was an error saving the List. Please try again."
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    if @list.destroy
      flash[:notice] = "You list was deleted successfully."
      redirect_to @list
    else
      flash[:error] = "There was an error deleting the topic."
      render :show
    end
  end

  private

  def list_params
    params.require(:list).permit(:title, :item)
  end

end
