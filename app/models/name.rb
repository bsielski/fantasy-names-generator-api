class Name < ApplicationRecord
  belongs_to :nameset, counter_cache: true
  acts_as_list scope: :nameset
end
