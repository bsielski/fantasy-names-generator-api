class Subgroup < ApplicationRecord
  belongs_to :group, counter_cache: true
  acts_as_list scope: :group
end
