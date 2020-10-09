class Article < ApplicationRecord
  belongs_to :user # , class_name: "user", foreign_key: "user_id"
  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 100 }
end
