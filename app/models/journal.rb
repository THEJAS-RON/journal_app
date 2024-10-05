class Journal < ApplicationRecord
  belongs_to :user
  has_one_attached :attachment
  validates :title, presence: true
  validates :content, presence: true
end
