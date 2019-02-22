class Nameset < ApplicationRecord
  belongs_to :subgroup, counter_cache: true
  has_many :names
  acts_as_list scope: :subgroup

  before_validation :normalize_label

  validates :label, length: { maximum: 60 }
  validates :label, presence: true

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
