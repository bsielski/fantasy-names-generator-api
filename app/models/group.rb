class Group < ApplicationRecord
  has_many :subgroups
  has_many :namesets, through: :subgroups
  before_validation :normalize_label
  acts_as_list

  validates :label, length: { maximum: 100 }
  validates :label, presence: true

  scope :with_empties, ->(bool) do
    where("subgroups_count > '0'") unless ActiveModel::Type::Boolean.new.cast(bool)
  end

  def as_json
    ActiveModelSerializers::SerializableResource.new(self, {}).as_json
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
