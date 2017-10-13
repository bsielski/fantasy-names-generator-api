class Api::V1::NamesetResource < JSONAPI::Resource
  attributes :subgroup_id, :position, :label, :source, :name_separator, :variant_separator, :names_count
  has_many :names
end
