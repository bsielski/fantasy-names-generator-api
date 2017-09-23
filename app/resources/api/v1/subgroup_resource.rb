class Api::V1::SubgroupResource < JSONAPI::Resource
  attributes :position, :namesets_count
  has_many :namesets
  belongs_to :group
end
