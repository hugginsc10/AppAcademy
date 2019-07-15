# require_relative "questionsdatabase"
# require_relative "question_class"
# require_relative "user_class"

class QuestionLike
    attr_reader :id
		attr_accessor :question_id, :user_id
    
  def self.find_by_id(id)
    users_datum = QuestionsDBConnection.instance.execute(<<-SQL, id: id)
      SELECT
        *
      FROM
        question_like
      WHERE
        id = :id  
    SQL
    return nil if users_datum.nil?
    QuestionLike.new(users_datum)
  end

    def self.likers_for_question_id(question_id)
      data = QuestionsDBConnection.instance.execute(<<-SQL, question_id: question_id)
      SELECT
        *
      FROM
        users
        JOIN
          question_likes ON users.id = question_likes.user_id
      WHERE
        question_likes.question_id = :question_id
      SQL
      data.map { |datum| User.new(datum) }
    end

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM question_like")
    data.map { |datum| QuestionLike.new(datum) }
  end

  def self.num_likes_for_question_id(question_id)
    data = QuestionsDBConnection.instance.get_first_value(<<-SQL, question_id: question_id)
    SELECT
      COUNT(*)
    FROM
      questions
      JOIN
        question_likes ON questions.id = question_likes.question_id
    WHERE
      questions.id = :question_id
    SQL
  end
  
  def self.liked_questions_for_user_id(user_id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, user_id: user_id)
    SELECT
     *
    FROM
      questions
        JOIN
          question_likes ON questions.id = question_likes.question_id
    WHERE
      question_likes.user_id = :user_id
    SQL
    data.map {|datum| Question.new(datum)}
  end
  
  def initialize(options)
		@id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
		
end