class Recipe < ActiveRecord::Base
  has_many :comments

  validates :name, presence: true, uniqueness: true,
            inclusion: { in: "Brussels sprouts" }

end
