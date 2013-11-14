require 'octokit'

module Marmite
  class User
    def initialize(username)
      @user = ::Octokit.user username
    end

    def email
      @user.email
    end
  end
end
