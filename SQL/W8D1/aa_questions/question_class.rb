# require_relative 'questionsdatabase'
# require_relative 'question_follow_class'
# require_relative 'user_class'

class Question
  attr_reader :id
  attr_accessor :title, :body, :author_id
    
  def self.find_by_id(id)
    users_datum = QuestionsDBConnection.instance.execute(<<-SQL, id: id)
      SELECT
        *
      FROM
        questions
      WHERE
        questions.id = :id  
    SQL
    return nil if users_datum.nil?
    users_datum.map { |datum| Question.new(datum) }
  end

  def self.find_by_user_id(user_id)
    users_datum = QuestionsDBConnection.instance.execute(<<-SQL, user_id: user_id)
      SELECT
        *
      FROM
        questions
      WHERE
        questions.author_id = :user_id  
    SQL
    return nil if users_datum.nil?
    users_datum.map { |datum| Question.new(datum) }
  end

  def author
    @author_id
  end
  
  def replies
    question_id = self.id
    Reply.find_by_question_id(question_id)
  end
  
    def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM questions")
    data.map { |datum| Question.new(datum) }
  end
  
  def self.most_followed(n = 1)
    QuestionFollow.most_followed_questions(n)
  end

	def initialize(options)
		@id = options['id']
		@title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def followers
    id = self.id
    QuestionFollow.followers_for_question_id(id)
  end
end