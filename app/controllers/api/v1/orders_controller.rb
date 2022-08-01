class Api::V1::OrdersController < ApplicationController

  def index
    # Retrieve all orders figure out how to incorporate lazy load
  end

  def best_customers
    @orders = Order.best_customers
    render json: OrdersSerializer.new(@orders).serializable_hash
  end

  def 
end
