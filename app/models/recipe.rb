class Recipe < ActiveRecord::Base
  has_many :comments

  validate :brussels_sprouts_in_name

  def brussels_sprouts_in_name
    if !name.include?("Brussels sprouts")
      errors.add(:name, "must include Brussels sprouts in recipe name")
    end
  end

  validates :name, presence: true, uniqueness: true

  validates :yield, numericality: { greater_than_or_equal_to: 1 }, allow_blank: true
  # validates_numericality_of :yield, greater_than_or_equal_to: 1

end
