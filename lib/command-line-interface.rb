require_relative "../lib/scraper.rb"
require_relative "../lib/verbiage.rb"

class CommandLineInterface
  attr_reader :movie

  def self.opening
    Verbiage.greeting
    Verbiage.about
    Verbiage.side_note
  end

  def self.podcast_list(movie_array)
    puts "\n\nPODCAST LIST"
    movie_array.each_with_index do |movie, index|
      puts "     #{index + 1}.     #{movie.title}"
    end
  end

  def self.get_movie_details(movie_array)
    Verbiage.detail_directions
    response = gets.chomp while response.to_i < 1 || response.to_i > movie_array.size
    puts "\n#{movie_array[response.to_i - 1].title}"
    puts "\n#{movie_array[response.to_i - 1].description}"
    Verbiage.detail_link_blurb
    puts "\nLink: #{movie_array[response.to_i - 1].link}"
  end

  def self.another_movie?
    answer = ""
    until answer.downcase == "n" || answer.downcase == "no"
      Verbiage.another_blurb
      answer = gets.chomp
      if answer.downcase == "y" || answer.downcase == "yes"
        podcast_list(Movie.all)
        get_movie_details(Movie.all)
      elsif answer.downcase == "n" || answer.downcase == "no"
        Verbiage.ex_blurb
      else
        "Please enter yes or no."
      end
    end
  end

end
