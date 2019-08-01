class Comment < ApplicationRecord
  validates :body, presence: true
  belongs_to :parent_comment,
    class_name: :Comment,
    primary_key: :id,
    foreign_key: :parent_comment_id
    
  belongs_to :post
  belongs_to :user
  has_many :child_comments,
    class_name: :Comment,
    primary_key: :id,
    foreign_key: :parent_comment_id
end
