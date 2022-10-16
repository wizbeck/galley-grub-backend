class ItemSerializer < BaseSerializer
  extend ActiveSupport::NumberHelper

  attributes :id, :name, :price, :item_type

  # Need to use options hash to specify attributes in the controller when instantiating ItemSerializer to retrive the proper values
  has_many :toppings, serializer: ToppingSerializer
end
