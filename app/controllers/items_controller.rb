class ItemsController < ApplicationController
  respond_to :html, :js

  def new
    @list = List.find(params[:list_id])
    @item = Item.new
  end

  def create
    @list = List.find(params[:list_id])
    @item = @list.items.build(item_params)

    if @item.save
      flash[:notice] = "Item was added to your list."
      redirect_to @list
    else
      flash[:error] = "There was an error saving the item. Please try again."
      render :new
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
    if @item.destroy
      flash[:notice] = "Item was completed!"
    else
      flash[:error] = "Item was not completed successfully."
    end

    respond_with(@item) do |format|
      format.html { redirect_to [@list.item] }
    end
  end

  private

  def item_params
    params.require(:item).permit(:body)
  end

end
