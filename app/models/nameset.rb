class Nameset < ApplicationRecord
  belongs_to :subgroup
  acts_as_list scope: :subgroup
end
