class Article < ApplicationRecord
    has_many :comments

    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }

    scope :published, -> { where(status: "public") }
    scope :archived, -> { where(status: "archived") }
    # def self.published
    #     where(status: "public")
    # end
end
