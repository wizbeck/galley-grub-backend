class OrderSerializer < BaseSerializer
  extend ActiveSupport::NumberHelper
  attributes :id, :cust_name
  attribute :total do |order|
    number_to_currency(order.total)
  end
  attribute :order_items do |order|
    order.order_items.map(&:to_json)
  end
  

  # Relationship data, similar to activerecord macros
  # specify serializer, to get the proper serialization of records to return in the api request
end
