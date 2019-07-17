# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  answer_choice_id :integer          not null
#  responder_id     :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord
	validates :responder_hasnt_answered
		
    belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id

    belongs_to :respondent,
    class_name: 'User',
    primary_key: :id,
    foreign_key: :responder_id

    has_one :question,
    through: :answer_choice,
    source: :question

   #def sibling_responses
   #  self.question.responses.where.not(id: self.id)
   #end

    def sibling_responses
      ac = {answer_choice_id: self.answer_choice_id, id: self.id}
      Response.find_by_sql([<<-SQL, ac])
        SELECT
					respones.*
				FROM (
					SELECT
						questions.*
					FROM
						questions
							JOIN answer_choices ON answer_choices.question_id = questions.id
					WHERE
						answer_choices.id = :answer_choice_id
					) AS quest
					JOIN
						answer_choices ON answer_choices.question_id = questions.id
					JOIN
						responses ON responses.answer_choice_id = answer_choices.id
					WHERE
						(responses.id != :id)
				SQL
    end
		def respondent_already_answered?
			sibling_responses.exists?(responder_id: self.responder_id)
		end

		def poll_author_isnt_respondent
			poll_author = self.answer_choice.question.poll.author_id

			if poll_author == self.responder_id
				errors[:responder_id] << 'responder cant be poll author'
			end
		end

		private
		def responder_hasnt_answered
			if respondent_already_answered?
				errors[:responder_id] << 'respondent already answered'
			end
		end
end
