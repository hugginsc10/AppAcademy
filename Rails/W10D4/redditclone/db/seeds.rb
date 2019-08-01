# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do
    User.destroy_all
    Sub.destroy_all
    User.create!(username: 'roger', password: 'anime_lover')
    User.create!(username: 'chas', password: 'titanic_theme_song')
    sub1 = Sub.create!(title: "Google", description: "subreddit for Google", moderator_id: 1)
    sub2 = Sub.create!(title: "Facebook", description: "subreddit for Facebook", moderator_id: 2)
    sub3 = Sub.create!(title: "Amazon", description: "subreddit for Amazon", moderator_id: 1)
end