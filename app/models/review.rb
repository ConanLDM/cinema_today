class Review < ApplicationRecord
  belongs_to :film

  validates :content, presence: true
end
