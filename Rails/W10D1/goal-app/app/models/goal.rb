class Goal < ApplicationRecord
    validates :title, presence: true
    validates :private, presence: true
    validates :details, presence: true
    validates :completed, presence: true
    validates :user_id, presence: true

    belongs_to :user

end