class Nameset < ApplicationRecord
  belongs_to :subgroup, counter_cache: true
  acts_as_list scope: :subgroup
end
