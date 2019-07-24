# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do
    User.destroy_all
    user1 = User.create!(username: 'CJ')
    user2 = User.create!(username: 'Flarnie')
    user3 = User.create!(username: 'Jeff')

    Poll.destroy_all
    poll1 = Poll.create!(title: 'Rails', author: user2)

    Question.destroy_all
    AnswerChoice.destroy_all
    Response.destroy_all
    quest1 = Question.create!(text: 'How do we seed a db?', poll: poll1)
    quest2 = Question.create!(text: 'What is ActiveRecord?', poll: poll1)

    ans1 = AnswerChoice.create!(text: 'using seeds.rb', question: quest1)
    ans2 = AnswerChoice.create!(text: 'read the rails docs!', question: quest1)

    ans3 = AnswerChoice.create!(text: 'why dont you google it', question: quest2)
    ans4 = AnswerChoice.create!(text: 'Again?! try the search function before posting', question: quest2)

    res1 = Response.create!(respondent: user1, answer_choice: ans1)
    res2 = Response.create!(respondent: user3, answer_choice: ans2)
    res3 = Response.create!(respondent: user3, answer_choice: ans3)
    res4 = Response.create!(respondent: user1, answer_choice: ans4)
end