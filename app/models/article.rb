class Article < ApplicationRecord
    has_many :comments
    belongs_to :user

    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }

    scope :published, -> { where(status: "public") }
    scope :archived, -> { where(status: "archived") }
    scope :not_public_users, -> { where("email != ? AND status = ?", Current.user.email, "public") }
    scope :public_private_articles, -> { where("status = ? OR status = ?", "public", "private") }
    # def self.published
    #     where(status: "public")
    # end
end
