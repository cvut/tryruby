require_relative 'level'
require_relative 'challenge_builder'

module Tryruby
  # Single tutorial level builder
  class LevelBuilder
    def initialize
      @challenges = []
    end

    def challenge(&block)
      builder = ChallengeBuilder.new
      builder.instance_eval(&block)
      @challenges << builder.challenge
    end

    def level
      Level.new(*@challenges)
    end
  end
end
