class OrdersController < ApplicationController
before_action :authenticate_user!, only:[:index,:create]
before_action :set_item, only: [:index,:create]




def index
  if  current_user.id == @item.user_id || @item.order != nil
    redirect_to root_path
  end

  @user_furima = UserFurima.new
end


def create
  @user_furima = UserFurima.new(furima_params)
  if @user_furima.valid?
    pay_item
    @user_furima.save
    redirect_to root_path
  else
    render action: :index
  end
end




private
def set_item
  @item = Item.find(params[:item_id])
end

def furima_params
  params.require(:user_furima).permit(:postal_code, :area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id,item_id:params[:item_id],token: params[:token] )
 end

 def pay_item
  Payjp.api_key = "sk_test_6f1a51cb67310c24638edea0"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
  Payjp::Charge.create(
    amount:@item.price,  # 商品の値段
    card: params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
end


end