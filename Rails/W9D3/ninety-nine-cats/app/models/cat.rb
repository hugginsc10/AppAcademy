# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string           not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'action_view'

class Cat < ApplicationRecord

    COLORS = %w(grey brown white black orange brindle)
    validates :color, inclusion: COLORS
    validates :sex, inclusion: %w(M F)
    validates :birth_date, :name, :sex, :color, presence: true
  


    # N.B. Remember, Rails 5 automatically validates the presence of
    # belongs_to associations, so we can leave the validation of author
    # and artwork out here.
    
    # validates :artwork_id, uniqueness: { scope: :viewer_id }
    # validates :favorite, inclusion: { in: [true, false] }
    def age
        time_ago_in_words(birth_date)
    end

    @attrs = [:birth_date, :name, :sex, :color]
end
