class GroupSerializer < ActiveModel::Serializer

  attributes :id, :label, :position, :subgroups_count
  has_many :subgroups

end
