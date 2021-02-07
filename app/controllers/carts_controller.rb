class CartsController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    flash[:success] = "<a href=#{item_path(item)}>#{item.title}</a> <span>has been added to your cart!</span>"
    redirect_to items_path
  end

  def show
    @items = @cart.retrieve_items
  end
end
