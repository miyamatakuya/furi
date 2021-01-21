class ItemsController < ApplicationController
  before_action :move_to_index, only: [:edit]
  before_action :authenticate_user! ,only:[:new,:edit, :update]

  
  def index
     @items = Item.includes(:user).order("created_at DESC") 
  end
 
def edit
  @item = Item.find(params[:id])
end


def update
  @item = Item.find(params[:id])
  if @item.update
    redirect_to root_path
  else
    render :edit
  end
end


  def new
    @item =Item.new
  end

  def show
    @item = Item.find(params[:id])
  end


  def create
    @item =Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  private

  def item_params
    params.require(:item).permit(:image,:name,:explanation,:category_id,:products_information_id,:bo_shipping_charge_id,:area_id,:estimated_shopping_date_id,:price).merge(user_id: current_user.id)
  end

  def move_to_index
    @item= Item.find(params[:id])
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

end
