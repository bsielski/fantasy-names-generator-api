class Api::V1::SubgroupResource < JSONAPI::Resource
  attributes :position, :group_id, :namesets_count
  has_many :namesets
end
