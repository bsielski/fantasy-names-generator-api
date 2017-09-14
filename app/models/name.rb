class Name < ApplicationRecord
  belongs_to :nameset
  acts_as_list scope: :nameset
end
