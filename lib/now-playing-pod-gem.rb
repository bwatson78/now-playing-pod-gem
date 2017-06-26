require_relative '../lib/scraper.rb'
require_relative '../lib/command-line-interface.rb'

class NowPlayingPodGem

  def self.start
    #These load the movies from the rss feed.
    Movie.scrape_movies
    Movie.sort_movies

    #These display the opening descriptors and instructions
    CommandLineInterface.greeting
    CommandLineInterface.about
    CommandLineInterface.side_note

    #Display the podcast list
    CommandLineInterface.podcast_list(Movie.all)

    #Ask if the user wants to get details about a certain movie
    CommandLineInterface.get_movie_details(Movie.all)

    #This gives option of seeing another movie's details or exit program
    CommandLineInterface.another_movie?
    
  end

end
