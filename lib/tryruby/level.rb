module Tryruby
  # Single tutorial level
  class Level
    include Enumerable

    def initialize(*challenges)
      @challenges = challenges
    end

    def [](n)
      @challenges[n]
    end

    def each(&block)
      @challenges.each(&block)
    end

    # Number of challenges in level
    def length
      @challenges.length
    end
  end
end
