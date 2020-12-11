class Post < ApplicationRecord

    belongs_to :user
    has_many :post_comments , dependent: :delete_all
    has_many :users_who_commented, through: :post_comments, source: :user

    validates :content, presence: :true

    scope :alphabetize, -> {order(content: :asc)}

    scope :most_commented_post, -> {joins(:post_comments).where('content > ?', 10).unique}


end
