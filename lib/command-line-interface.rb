require_relative "../lib/scraper.rb"

class CommandLineInterface
  attr_reader :movie

  def self.greeting
    puts "Hello, and welcome to the Now Playing Podcast GEM!"
    puts ""
  end

  def self.about
    puts "The Now Playing Podcast is one of the most popular movie review podcasts available."
    puts "Each week, Arnie, Stuart, and Jakob tackle a new movie and let you know whether to"
    puts "skip that flick or buy a ticket (or digital copy)!"
    puts ""
    puts "What makes these guys better than the rest?"
    puts "Why, laser-sharp sarcastic humor and mounds of cursing--that's what!"
    puts ""
  end

  def self.side_note
    puts "SIDE NOTE: They have hundreds of reviews available to you right now, and at least"
    puts "one new review each week, but Now Playing also holds donation drives bi-annually"
    puts "to cover costs. During those drives, bonus podcasts are distributed to donors."
    puts "Please check out their donation web page at http://www.nowplayingpodcast.com/donate.htm"
    puts "to see if you're interested in the additional reviews that come with your donation."
    puts ""
    puts ""
  end

  def self.podcast_list(movie_array)
    puts "PODCAST LIST"
    movie_array.each_with_index do |movie, index|
      puts "     #{index + 1}.     #{movie.title}"
    end
  end

  def self.get_movie_details(movie_array)
    puts "To see the description of the review and the direct link of the podcast's mp3,"
    puts "please enter the podcast number in the space below:"
    response = gets.chomp while response.to_i < 1 || response.to_i > movie_array.size
    puts ""
    puts "#{movie_array[response.to_i - 1].title}"
    puts ""
    puts "#{movie_array[response.to_i - 1].description}"
    puts ""
    puts "To listen to this podcast directly through the browser on your computer,"
    puts "please copy and paste the link below into it's address bar:"
    puts "Link: #{movie_array[response.to_i - 1].link}"
  end

    def self.another_movie?
      answer = ""
      until answer.downcase == "n" || answer.downcase == "no"
        puts ""
        puts "Would you like to find details of another movie?"
        puts "Please respond yes or no:"
        answer = gets.chomp
        if answer.downcase == "y" || answer.downcase == "yes"
          podcast_list(Movie.all)
          get_movie_details(Movie.all)
        elsif answer.downcase == "n" || answer.downcase == "no"
          puts ""
          puts "Thank You For Using Now Playing Podcast GEM"
          puts "Please pass this along to your friends!"
        else
          "Please enter yes or no."
        end
      end
    end


  end
