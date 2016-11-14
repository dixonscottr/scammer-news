# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = []
10.times do
  users << User.create!(username: Faker::Name.first_name.downcase, password: 'password')
end

articles = []
50.times do
  author = users.sample
  articles << Article.create!(title: Faker::Hipster.sentence(3), link: "https://www.google.com/#tbm=nws&q=#{Faker::App.author}", author: author)
end

comments = []
100.times do
  article = articles.sample
  commenter = users.sample
  comments << Comment.create!(content: Faker::Hipster.sentence(8), article: article, commenter: commenter)
end
