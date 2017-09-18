class NamesetSerializer < ActiveModel::Serializer

  attributes :id, :label, :position, :names_count
  has_many :names

end
