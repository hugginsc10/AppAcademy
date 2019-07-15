require 'sqlite3'
require 'singleton'
require_relative 'question_class'
require_relative 'question_follow_class'
require_relative 'question_like_class'
require_relative 'reply_class'
require_relative 'user_class'

class QuestionsDBConnection < SQLite3::Database
    include Singleton
    
  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end

end