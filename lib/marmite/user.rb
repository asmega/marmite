require 'octokit'

module Marmite
  class User
    def initialize(username)
      client = Octokit::Client.new :access_token => "token"

      @user = client.user username
    end

    def email
      user.email
    end

    def repos
      @repos ||= user.rels[:repos].get.data
    end

    def languages
      hash = {}

      repos.map(&:language).compact.each do |lang|
        hash[lang] = (hash[lang] || 0) + 1
      end

      hash
    end

    def favourite_language
      languages.max{|a,b| a.last <=> b.last}.first
    end

    private

    def user
      @user
    end
  end
end
