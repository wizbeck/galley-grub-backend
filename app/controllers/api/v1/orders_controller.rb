class Api::V1::OrdersController < ApplicationController
  def index
    # Retrieve all orders figure out how to incorporate lazy load
    @orders = Order.order(:created_at).limit(50)
    render json: OrderSerializer.new(@orders).serializable_hash, status: :ok
  end

  def best_customers
    @orders = Order.best_customers
    render json: OrderSerializer.new(@orders).serializable_hash, status: :ok
  end
end
