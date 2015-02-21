require 'ripl'
require 'ripl/multi_line'
require_relative 'shell'
require_relative 'commands'

module Tryruby
  # Startup class of the shell
  class Runner
    def self.start(tutorials)
      Ripl::Shell.include Tryruby::Shell
      Ripl::Commands.include Tryruby::Commands
      tutorials.each do |tutorial|
        tutorial.each { |level| Ripl.shell.levels << level }
        Ripl::Commands.include tutorial.commands
      end
      Ripl.start
    end
  end
end
