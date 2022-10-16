class OrderSerializer < BaseSerializer
  extend ActiveSupport::NumberHelper
  attributes :id, :cust_name, :total
  # attribute :total do |order|
  #   number_to_currency(order.total)
  # end
  attribute :order_items do |order|
    order.order_items.map do |oi|
      {
        id: oi.id,
        item_id: oi.item_id,
        toppings: oi.toppings&.map { |t| ToppingSerializer.new(t).serializable_hash }
      }
    end
  end
end
