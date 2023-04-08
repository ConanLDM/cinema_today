require 'faker'

num_films = 10
num_paragraphs = 3

num_films.times do
  # The following code will generate a film title and body
  title = Faker::Movie.title
  body = Faker::Lorem.paragraphs(number: num_paragraphs, supplemental: false).join("\n\n")

  # This will create a new film in the database
  Film.create(title: title, body: body)
end

# Message below is showing the creation of films
p "Created #{num_films} films with #{num_paragraphs} paragraphs each."
