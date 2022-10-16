class ToppingSerializer < BaseSerializer
  extend ActiveSupport::NumberHelper
  attributes :name, :price
end
