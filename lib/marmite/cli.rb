require 'highline/import'

module Marmite
  class Cli
    def self.run!
      self.new.run!
    end

    def run!
      say "Use this tool to find out someone's favourite programming language."
      username = ask("Please enter the their GitHub username:")
      user = User.new username
      say("We think they're favourite language is: #{user.favourite_language}")
    rescue User::NotFound
      say "Looks like that user doesn't exist in Github."
    end
  end
end
