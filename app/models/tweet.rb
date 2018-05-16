class Tweet < ApplicationRecord
  belongs_to :user
  
  validates :text, presence: true, length: {maximum: 280 }
  # validate :picture_size
  
  # private 
  
  # def picture_size
  #   if picture.size > 5.megabytes
  #     errors.add(:picture, "should be less 5MB ")
  #   end
  # end
end
