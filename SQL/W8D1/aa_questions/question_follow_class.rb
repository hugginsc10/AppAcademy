# require_relative "questionsdatabase"
# require_relative "question_class"
# require_relative "user_class"

class QuestionFollow
    attr_reader :id
	attr_accessor :user_id, :question_id
    
  def self.find_by_id(id)
    users_datum = QuestionsBConnection.instance.execute(<<-SQL, id: id)
      SELECT
        *
      FROM
        questions_follows
      WHERE
        id = :id  
    SQL
    return nil if users_datum.nil?
    QuestionFollow.new(user_datum)
  end

   
  def self.all
	  data = QuestionsDBConnection.instance.execute("SELECT * FROM questions_follows")
	  data.map { |datum| QuestionFollow.new(datum) }
  end

  def self.followers_for_question_id(question_id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, question_id: question_id)
    SELECT
      *
    FROM
      users
      JOIN
        questions_follows ON users.id = questions_follows.user_id
    WHERE
      questions_follows.question_id = :question_id
    SQL

    data.map {|datum| User.new(datum)}
  end

  def self.followed_questions_for_user_id(user_id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, user_id: user_id)
    SELECT
      *
    FROM
      questions
      JOIN
        questions_follows ON questions.id = questions_follows.question_id
    WHERE
      questions_follows.user_id = :user_id
    SQL
      data.map {|datum| Question.new(datum)}
  end
  
  def self.most_followed_questions(n)
    data = QuestionsDBConnection.instance.execute(<<-SQL, limit: n)
    SELECT
      *
    FROM
      questions
      JOIN
        questions_follows ON questions_follows.question_id = questions.id
    GROUP BY
      questions.id
    ORDER BY
      COUNT(*) DESC
    LIMIT
      :limit
    
    SQL
    data.map { |datum| Question.new(datum) }
  end
      
  def initialize(options)
		@id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
		
end