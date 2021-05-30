class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
