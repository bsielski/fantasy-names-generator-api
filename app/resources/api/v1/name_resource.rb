class Api::V1::NameResource < JSONAPI::Resource
  attributes :nameset_id, :position, :variants
  belongs_to :nameset
end
