class ItemSerializer
  include JSONAPI::Serializer
  attributes :name, :price
  attribute :menu_type, &:item_type
end
