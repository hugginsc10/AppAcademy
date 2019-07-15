# require_relative "questionsdatabase"
# require_relative "question_class"
# require_relative "question_follow_class"
# require_relative "user_class"

class Reply
	
	attr_reader :id
	attr_accessor :question_id, :parent_reply, :author_id, :body
		
	# finds each REPLY by the REPLY_ID
	def self.find_by_id(id)
		users_datum = QuestionsDBConnection.instance.execute(<<-SQL, id: id)
			SELECT
				*
			FROM
				replies
			WHERE
				id = :id  
		SQL
		return nil if users_datum.nil?
		user_datum.map { |datum| Reply.new(datum) }
	end
	
	def self.find_by_parent_id(parent_id)
		data = QuestionsDBConnection.instance.execute(<<-SQL, parent_reply: parent_id)
		SELECT
			*
		FROM
			replies
		WHERE
			parent_reply = :parent_reply
		SQL
		data.map { |datum| Reply.new(datum) }
	end

	# finds each REPLY by QUESTION_ID
	def self.find_by_question_id(question_id)
		users_datum = QuestionsDBConnection.instance.execute(<<-SQL, question_id: question_id)
			SELECT
				*
			FROM
				replies
			WHERE
				question_id = :question_id
		SQL
		return nil if users_datum.nil?
		users_datum.map { |datum| Reply.new(datum) }
	end
		
	# finds each REPLY by POSTER/USER_ID
	def self.find_by_user_id(user_id)
		data = QuestionsDBConnection.instance.execute(<<-SQL, user_id: user_id)
		SELECT
			*
		FROM
			replies
		WHERE
			author_id = :user_id
		SQL
		data.map { |datum| Reply.new(datum) }
	end
	 
	# finds EVERY REPLY
	def self.all
		data = QuestionsDBConnection.instance.execute("SELECT * FROM replies")
		data.map { |datum| Reply.new(datum) }
	end
				
	def initialize(options)
		@id = options['id']
		@question_id = options['question_id']
		@parent_reply = options['parent_reply']
		@author_id = options['author_id']
		@body = options['body']
  	end
	
	# returns AUTHOR_ID of a REPLY
	def author
		@author_id
	end	

	# returns QUESTION_ID that a REPLY belongs to
	def question
		@question_id
	end

	def parent_reply
		@parent_reply
	end
	
	def child_reply
		id = @id
		Reply.find_by_parent_id(id)
	end
end