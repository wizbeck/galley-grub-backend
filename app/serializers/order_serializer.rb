class OrderSerializer
  extend ActiveSupport::NumberHelper
  attributes :id, :cust_name
  attribute :total do |order|
    number_to_currency(order.total)
  end

  has_many :order_items, serializer: OrderItemSerializer

  # Relationship data, similar to activerecord macros
  # specify serializer, to get the proper serialization of records to return in the api request

end
