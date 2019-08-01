class Sub < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  has_many :posts
  has_many :post_subs

  belongs_to :moderator,
    class_name: :User,
    primary_key: :id,
    foreign_key: :moderator_id
end
