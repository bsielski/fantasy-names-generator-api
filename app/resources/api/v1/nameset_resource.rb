class Api::V1::NamesetResource < JSONAPI::Resource
  attributes :position, :label, :source, :name_separator, :variant_separator, :names_count
  has_many :names
  belongs_to :subgroup
end
