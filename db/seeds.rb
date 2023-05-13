# require 'faker'

Film.destroy_all

films = [
  { title: 'The Shawshank Redemption', body: 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.' },
  { title: 'The Godfather', body: 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.'},
  { title: 'The Dark Knight', body: 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.' },
  { title: 'Eraserhead', body: 'A man tries to survive in an industrial wasteland while caring for his deformed baby.' },
  { title: 'Blue Velvet', body: 'A young man returns to his hometown and becomes embroiled in a dark underworld of sex and violence.' },
  { title: 'Mulholland Drive', body: 'A woman with amnesia tries to piece together her past while navigating the seedy underbelly of Hollywood.' },
  { title: 'Lost Highway', body: 'A jazz musician is accused of murdering his wife and goes on the run, only to find himself in a surreal alternate reality.' },
  { title: 'Inland Empire', body: 'An actress becomes embroiled in a mysterious and terrifying world while filming a movie.' },
  { title: 'Donnie Darko', body: 'A troubled teenager is plagued by visions of a giant rabbit that may or may not be real.' },
  { title: 'The Cell', body: 'An FBI agent enters the mind of a comatose serial killer to find his latest victim.' },
  { title: 'The Grandmother', body: 'A young boy grows a grandmother from a seed and discovers the horrors of his own creation.' }
]

films.each do |film|
  Film.create(film)
end

# num_films = 10
# num_paragraphs = 3

# num_films.times do
#   # The following code will generate a film title and body
#   title = Faker::Movie.title
#   body = Faker::Lorem.paragraphs(number: num_paragraphs, supplemental: false).join("\n\n")

#   # This will create a new film in the database
#   Film.create(title: title, body: body)
# end

# Message below is showing the creation of films
p "Added #{'11'} films to the website with #{'description'} paragraphs if located."
