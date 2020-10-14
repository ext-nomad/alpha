class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  validates :content, presence: true, length: { minimum: 10, maximum: 255 }
end
