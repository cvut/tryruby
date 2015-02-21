require 'stringio'
require_relative 'colors'
require_relative 'next_fix'

module Tryruby
  # Shell extension
  module Shell
    include Tryruby::NextFix
    attr_writer :levels

    def before_loop
      super
      @level, @challenge = 0, -1
      next_challenge
      setup_challenge if @challenge_changed
      @challenge_changed = false
      @output = ''
    end

    def loop_once
      throw :ripl_exit unless challenge
      super
      result = @error_raised ? @error : @result
      if challenge && \
        challenge.test(repl_self, result, read_variables, @output)
        puts Colors.success('Success!')
        next_challenge
      end
      setup_challenge if @challenge_changed
      @challenge_changed = false
    end

    def loop_eval(str)
      stdout_saved = $stdout
      $stdout = StringIO.new
      begin
        super(str)
      ensure
        @output = $stdout.string
        $stdout = stdout_saved
        puts @output if @output != ''
      end
    end

    def print_eval_error(error)
      @error = error
      super(error)
    end

    def format_error(error)
      Colors.error(super(error))
    end

    def format_result(result)
      Colors.result(super(result))
    end

    def levels
      @levels ||= []
    end

    def level
      levels[@level] if @level >= 0
    end

    def challenge
      level[@challenge] if level && @challenge >= 0
    end

    def next_challenge
      @challenge += 1
      while level && !challenge
        @challenge = 0
        @level += 1
      end
      @challenge_changed = true if challenge
      nil
    end

    def prev_challenge
      lvl, chall = @level, @challenge - 1
      while lvl > 0 && chall < 0
        lvl -= 1
        chall = levels[lvl].length - 1
      end
      return if chall < 0
      @level, @challenge = lvl, chall
      @challenge_changed = true
      nil
    end

    def help_challenge
      puts challenge.help if challenge
    end

    private

    def repl_self
      eval('self', @binding)
    end

    def read_variables
      vars = eval('local_variables', @binding).map do |var|
        [var, @binding.local_variable_get(var)]
      end
      Hash[vars]
    end

    def write_variables(vars)
      vars.each { |sym, value| @binding.local_variable_set(sym, value) }
    end

    def setup_challenge
      return unless challenge
      vars = read_variables
      challenge.setup(repl_self, vars)
      write_variables(vars)
      puts challenge.setup_source if challenge.display_setup
      help_challenge
    end
  end
end
