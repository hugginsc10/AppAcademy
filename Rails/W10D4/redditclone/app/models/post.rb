class Post < ApplicationRecord
  validates :title, :url, :content, presence: true
  validates :subs, presence: true
  
  belongs_to :sub
  belongs_to :user

  has_many :post_subs
  has_many :subs,
    through: :post_subs,
    source: :sub

  belongs_to :author,
  class_name: :User,
  foreign_key: :user_id

end
