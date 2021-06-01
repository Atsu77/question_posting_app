class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content,  length: { maximum: 140 }
end
 