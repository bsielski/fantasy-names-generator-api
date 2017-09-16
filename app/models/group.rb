class Group < ApplicationRecord
  has_many :subgroups
  before_validation :normalize_label
  acts_as_list

  validates :label, length: { maximum: 100 }
  validates :label, presence: true

  scope :with_empties, ->(bool) do
    where("subgroups_count > '0'") unless bool
  end

  private

  def normalize_label
    if self.label
      self.label = normalize_whitespaces(self.label)
    end
  end

  def normalize_whitespaces(string)
    result = string.gsub(/\s+/, " ")
    result = result.strip
    result
  end



end
