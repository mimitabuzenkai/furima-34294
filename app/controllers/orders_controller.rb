class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :create]
  before_action :move_to_index, except: [:index, :create]
  before_action :authenticate_user!


  def index
    @order_pay_form = OrderPayForm.new
  end

  def create
    @order_pay_form = OrderPayForm.new(order_params)
    if @order_pay_form.valid?
      pay_item
      @order_pay_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_pay_form).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token], 
      currency: 'jpy'               
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user.id
      redirect_to root_path and return
    end
  end
end

