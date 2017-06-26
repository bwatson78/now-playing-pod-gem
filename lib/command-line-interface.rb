require_relative "../lib/scraper.rb"

class CommandLineInterface
  attr_reader :movie

  def self.opening
    self.greeting
    self.about
    self.side_note
  end

  def self.podcast_list(movie_array)
    puts "\n\nPODCAST LIST"
    movie_array.each_with_index do |movie, index|
      puts "     #{index + 1}.     #{movie.title}"
    end
  end

  def self.get_movie_details(movie_array)
    self.detail_directions
    response = gets.chomp while response.to_i < 1 || response.to_i > movie_array.size
    puts "\n#{movie_array[response.to_i - 1].title}"
    puts "\n#{movie_array[response.to_i - 1].description}"
    self.detail_link_blurb
    puts "\nLink: #{movie_array[response.to_i - 1].link}"
  end

  def self.another_movie?
    answer = ""
    until answer.downcase == "n" || answer.downcase == "no"
      self.another_blurb
      answer = gets.chomp
      if answer.downcase == "y" || answer.downcase == "yes"
        podcast_list(Movie.all)
        get_movie_details(Movie.all)
      elsif answer.downcase == "n" || answer.downcase == "no"
        self.ex_blurb
      else
        "Please enter yes or no."
      end
    end
  end

  private

    def self.greeting
      puts "Hello, and welcome to the Now Playing Podcast GEM!"
    end

    def self.about
      puts "\nThe Now Playing Podcast is one of the most popular movie review podcasts available."
      puts "Each week, Arnie, Stuart, and Jakob tackle a new movie and let you know whether to"
      puts "skip that flick or buy a ticket (or digital copy)!"
      puts "\nWhat makes these guys better than the rest?"
      puts "Why, laser-sharp sarcastic humor and mounds of cursing--that's what!"
    end

    def self.side_note
      puts "\n\nSIDE NOTE: They have hundreds of reviews available to you right now, and at least"
      puts "one new review each week, but Now Playing also holds donation drives bi-annually"
      puts "to cover costs. During those drives, bonus podcasts are distributed to donors."
      puts "Please check out their donation web page at http://www.nowplayingpodcast.com/donate.htm"
      puts "to see if you're interested in the additional reviews that come with your donation."
    end

    def self.detail_directions
      puts "To see the description of the review and the direct link of the podcast's mp3,"
      puts "please enter the podcast number in the space below:"
    end

    def self.detail_link_blurb
      puts "\nTo listen to this podcast directly through the browser on your computer,"
      puts "please copy and paste the link below into it's address bar:"
    end

    def self.another_blurb
      puts "\nWould you like to find details of another movie?"
      puts "Please respond yes or no:"
    end

    def self.ex_blurb
      puts "\nThank You For Using Now Playing Podcast GEM"
      puts "Please pass this along to your friends!"
    end
end
