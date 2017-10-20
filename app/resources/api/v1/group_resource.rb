class Api::V1::GroupResource < JSONAPI::Resource
  attributes :label, :position, :subgroups_count, :custom
  has_many :subgroups
end
