class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  # validates :commenter, presence: true
  validates :body, presence: true
end
