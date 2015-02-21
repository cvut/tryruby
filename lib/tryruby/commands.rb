require 'ripl'

module Tryruby
  # Basic commands
  module Commands
    def next
      Ripl.shell.next_challenge
    end

    def back
      Ripl.shell.prev_challenge
    end

    def help
      Ripl.shell.help_challenge
    end
  end
end
