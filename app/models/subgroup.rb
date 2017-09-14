class Subgroup < ApplicationRecord
  belongs_to :group
  acts_as_list scope: :group
end
