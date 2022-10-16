class Api::V1::OrdersController < ApplicationController
  # STRETCH
  def index
    orders = Order.order(:created_at).limit(50)
    render json: OrderSerializer.new(orders, orders_opts).serializable_hash, status: :ok
  end

  # STRETCH -> show orders by highest total amount (best_customers scope)
  def best_customers
    orders = Order.best_customers
    render json: OrderSerializer.new(orders, orders_opts).serializable_hash, status: :ok
  end

  # Shows an order and all its details needed
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
