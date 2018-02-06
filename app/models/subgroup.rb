class Subgroup < ApplicationRecord
  belongs_to :group, counter_cache: true
  has_many :namesets

  acts_as_list scope: :group
end
