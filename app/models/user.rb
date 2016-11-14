class User < ApplicationRecord
  has_many :articles, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'commenter_id'
  has_many :votes, foreign_key: 'voter_id'

  validates :username, uniqueness: true, presence: true

  has_secure_password

end
