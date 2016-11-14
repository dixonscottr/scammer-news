class Article < ApplicationRecord
  has_many :comments
  belongs_to :author, class_name: User
  has_many :votes, as: :votable

  validates :title, length: {minimum: 5}, presence: true, uniqueness: true
  validates :link, presence: true, uniqueness: true
  # validates :link, :link => true


end
