require 'nokogiri'
require 'open-uri'
require 'pry'

class Movie
  attr_accessor :title, :description, :link
  @@all = []
  PAGE = Nokogiri::XML(open("http://nowplayingpodcast.libsyn.com/rss"))

  def initialize(attributes = {})
    @title = attributes[:title]
    @description = attributes[:description]
    @link = attributes[:link]
    @@all << self
  end

  def self.scrape_movies
    PAGE.css('item').each do |movie|
      self.new({
        title: movie.css('title').text,
        description: movie.css('description').text.gsub(/<\/?[^>]*>/, ""),
        link: movie.css('enclosure').attr('url').value
      })
      # movie_title = movie.css('title').text
      # movie_description = movie.css('description').text
      # movie_link = movie.css('enclosure').attr('url').value
      # @movies << {title: movie_title, description: movie_description, link: movie_link}
    end
  end

  def self.sort_movies
    @@all.sort_by!{ |movie| movie.title.downcase }
    # @movies = movies_sorted
  end

  def self.all
    @@all
  end
end
