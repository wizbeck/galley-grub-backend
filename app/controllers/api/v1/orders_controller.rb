class Api::V1::OrdersController < ApplicationController
  def index
    # Retrieve all orders figure out how to incorporate lazy load
    orders = Order.order(:created_at).limit(50)
    render json: OrderSerializer.new(orders, orders_opts).serializable_hash, status: :ok
  end

  def best_customers
    orders = Order.best_customers
    render json: OrderSerializer.new(orders, orders_opts).serializable_hash, status: :ok
  end

  def show
    order = Order.find(params[:order_id])
    render json: OrderSerializer.new(order, order_opts).serializable_hash, status: :ok
  end

  private

  def order_opts
    {
      include: [:order_items]
    }
  end

  def orders_opts
    {
      is_collection: true
    }
  end
end
