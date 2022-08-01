class OrderSerializer
  include JSONAPI::Serializer
  attribute :order_number do |object|
    object.id.to_s.rjust(6, '0')
  end
  attribute :cust_name
  attribute :total do |object|
    '%.2f' %object.total
  end
  # has_many :items
end
