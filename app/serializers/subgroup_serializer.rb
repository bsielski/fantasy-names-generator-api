class SubgroupSerializer < ActiveModel::Serializer

  attributes :id, :position, :namesets_count
  has_many :namesets

end
