require 'tryruby/challenge'
require 'tryruby/colors'

module Tryruby
  # Single challenge level builder
  class ChallengeBuilder
    include Colors

    attr_writer :help, :test, :setup, :display_setup
    alias_method :help, :help=
    alias_method :display_setup, :display_setup=

    def initialize
      @help = ''
      @test = nil
      @setup = nil
      @display_setup = false
    end

    def test(&block)
      self.test = block
    end

    def setup(&block)
      self.setup = block
    end

    def challenge
      Challenge.new(@help, @test, @setup, @display_setup)
    end
  end
end
