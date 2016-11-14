class Comment < ApplicationRecord
  belongs_to :commenter, class_name: User
  belongs_to :article

  has_many :votes, as: :votable

  validates :content, presence: true, uniqueness: true, length: {minimum: 10}
end
