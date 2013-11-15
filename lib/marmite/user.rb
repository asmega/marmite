require 'octokit'

module Marmite
  class User
    class NotFound < Exception; end

    def initialize(username)
      client = Octokit::Client.new :access_token => "token"

      @user = client.user username
    rescue Octokit::NotFound
      raise NotFound
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
