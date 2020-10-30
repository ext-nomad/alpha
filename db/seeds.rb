User.create!(username: 'Nomad', email: 'nomad@example.com', password: 'password')

9.times do |n|
  name = Faker::Name.first_name
  email = "example-#{n + 1}@example.com"
  User.create!(username: name, email: email, password: email)
end

def rand_id(from, to)
  Faker::Number.between(from: from, to: to)
end

60.times do
  Article.create!([{
                    title: Faker::Educator.subject,
                    description: Faker::Lorem.paragraph(sentence_count: 10),
                    user_id: rand_id(1, 10)
                  }])
end

10.times do
  Category.create!([{ name: Faker::Music.unique.genre }])
end

30.times do
  ArticleCategory.create!([{
                            article_id: rand_id(1, 60),
                            category_id: rand_id(1, 10)
                          }])
end

80.times do
  Comment.create!([{
                    content: Faker::Lorem.paragraph(sentence_count: 10),
                    user_id: rand_id(1, 10),
                    article_id: rand_id(1, 60)
                  }])
end
