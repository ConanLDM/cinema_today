# 21/05/2023: Withheld imdb_parser.rake from git commit as requires further assessement

# require 'open-uri'
require 'nokogiri'
require 'httparty'


namespace :imdb_parser do
  desc 'Scrape IMDB for film images'
  task scrape_images: :environment do
    begin
      # Your scraping code here

      # # Fetch IMDB page of films
      # url = ''
      # html = open(url)
      # doc = Nokogiri::HTML(html)
      # Fetch IMDB page of films
      url = ''
      response = HTTParty.get(url, verify: false)
      html = response.body

      # Parse HTML with Nokogiri
      doc = Nokogiri::HTML(html)

      # Parse film information
      films = []
      doc.css('.lister-list tr').each do |row|
        title = row.css('.titleColumn a').text.strip
        imdb_id = row.css('.titleColumn a').attr('href').text.split('/')[2]
        films << { title: title, imdb_id: imdb_id }
      end

      # Save films to the database
      films.each do |film|
        Film.create(film)
      end

      puts 'Film images scraped and saved!'
    rescue StandardError => e
      puts "An error occurred: #{e.message}"
    end
  end
end
