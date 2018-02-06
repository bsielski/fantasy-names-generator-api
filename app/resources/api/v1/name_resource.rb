class Api::V1::NameResource < JSONAPI::Resource
  attributes :nameset_id, :position, :variants
  filter :nameset_id
end
