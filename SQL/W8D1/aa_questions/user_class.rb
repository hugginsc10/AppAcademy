# require_relative "questionsdatabase"
# require_relative "question_class"
# require_relative "question_follow_class"

class User
  attr_reader :id
	attr_accessor :fname, :lname
  def self.find_by_name(fname, lname)
		data = QuestionsDBConnection.instance.execute(<<-SQL, fname: fname, lname: lname)
    SELECT
      *
    FROM
      users
    WHERE
      fname = :fname AND lname = :lname
    SQL
    return nil if data.nil?
    data.map { |datum| User.new(datum) }
  end
  
  def self.authored_questions(author_id)
    authored = Question.find_by_user_id(author_id)
  end
  
  def self.authored_replies(user_id)
    authored = Reply.find_by_user_id(user_id)
  end
  
  def self.all
		data = QuestionsDBConnection.instance.execute("SELECT * FROM users")
		data.map { |datum| User.new(datum) }
  end
  
	def initialize(options)
		@id = options['id']
		@fname = options['fname']
		@lname = options['lname']
  end
  
  def followed_questions
    id = self.id
    QuestionFollow.followed_questions_for_user_id(id)  
  end
  
  def self.find_by_id(id)
   users_datum = QuestionsDBConnection.instance.execute(<<-SQL, id: id)
     SELECT
       *
     FROM
       users
     WHERE
       users.id = :id  
   SQL
   return nil if users_datum.nil?
   users_datum.map { |datum| User.new(datum) }
  end
  
end