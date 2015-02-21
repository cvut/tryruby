require 'tryruby/level_builder'

module Tryruby
  # Base module for level DSL
  class Tutorial
    extend Enumerable

    # Commands to be imported
    module Commands
    end

    def initialize
      @levels = []
      self.class.each do |block|
        builder = LevelBuilder.new
        builder.instance_eval(&block)
        @levels << builder.level
      end
    end

    def [](i)
      @levels[i]
    end

    def each(&block)
      @levels.each(&block)
    end

    def length
      @levels.length
    end

    def commands
      self.class::Commands
    end

    def self.each(&block)
      levels.each(&block)
    end

    def self.level(&block)
      levels << block
    end

    def self.levels
      @levels ||= []
    end

    class << self
      private :level, :levels
    end
  end
end
