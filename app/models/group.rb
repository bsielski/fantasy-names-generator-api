class Group < ApplicationRecord
  before_validation :normalize_label

  validates :label, length: { maximum: 100 }
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
