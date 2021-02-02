class ItemsController < ApplicationController
  before_action :authenticate_user! ,except:[:index,:show]
  before_action :set_item,only:[:edit,:show,:update,:destroy]
  before_action :move_to_index, only: [:edit,:destroy]
  before_action :sold_to_index,only: [:edit]

  
  def index
     @items = Item.includes(:user).order("created_at DESC") 
  end
 
def edit
  
end


def update
  if @item.update(item_params)
    redirect_to root_path
  else
    render :edit
  end
end


  def new
    @item =Item.new
  end

  def show
  end


  def destroy
    if @item.destroy
      redirect_to root_path
    else 
      render :show
      end
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
    unless  current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end


  def sold_to_index
    unless  @item.order == nil
      redirect_to action: :index
    end
  end


end
