class Group < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  has_many :users
  has_many :movies
end
