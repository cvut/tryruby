require 'sourcify'

module Tryruby
  # Single tutorial challenge
  class Challenge
    attr_reader :help, :display_setup

    def initialize(help, test = nil, setup = nil, display_setup = false)
      @help, @test, @setup, @display_setup = help, test, setup, display_setup
    end

    def test(repl, result, vars, output)
      repl.instance_exec(result, vars, output, &@test) if @test
    end

    def setup(repl, vars)
      repl.instance_exec(vars, &@setup) if @setup
    end

    # Challenge setup as text
    def setup_source
      return '' unless @setup
      vars_name = @setup.parameters[0][1]
      source = @setup.to_source(strip_enclosure: true)
      source.gsub(/#{vars_name}\[:([^\]]+)\]/, '\1')
    end
  end
end
