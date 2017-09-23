class Api::V1::NameResource < JSONAPI::Resource
  attributes :position, :variants
  belongs_to :nameset
end
