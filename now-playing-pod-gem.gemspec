Gem::Specification.new do |s|
  s.name        = 'now-playing-pod-gem'
  s.version     = '1.0.2'
  s.date        = '2016-09-01'
  s.summary     = "Now Playing Podcast Listings"
  s.description = "This Gem lists all of Now Playing's Podcasts with title, description and links to a playable mp3"
  s.authors     = ["Brad Watson"]
  s.email       = 'brad.watson.orlando@gmail.com'
  s.files       = ["bin/now-playing-pod", "lib/now-playing-pod-gem.rb", "lib/command-line-interface.rb", "lib/scraper.rb", "lib/verbiage.rb"]
  s.executables = ["now-playing-pod"]
  s.homepage    =
    'https://github.com/bwatson78/now-playing-pod-gem'
  s.license       = 'MIT'
end
