require 'octokit'

module Marmite
  class User
    def initialize(username)
      @user = ::Octokit.user username
    end

    def email
      user.email
    end

    def repos
      @repos ||= user.rels[:repos].get.data
    end

    private

    def user
      @user
    end
  end
end
