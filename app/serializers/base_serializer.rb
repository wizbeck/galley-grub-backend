# Base serializer class that all serializers should inherit from
class BaseSerializer
  include JSONAPI::Serializer

  # global macros that all serializers can use?
  # Can we add any methods that all serializers can use?
  # maybe a base serialization
end
