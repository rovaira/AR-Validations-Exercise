class Comment < ActiveRecord::Base
  belongs_to :recipe

  validates_associated :recipe
  # Don't use validates_associated on both ends of your associations.
  # They would call each other in an infinite loop.


  validates :recipe_id, presence: true, uniqueness: true
  validates :body, presence: true, length: { maximum: 140 }
end
