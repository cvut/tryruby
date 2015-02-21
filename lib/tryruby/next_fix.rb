module Tryruby
  # evals 'next' as 'self.next' instead of keyword
  module NextFix
    def loop_eval(str)
      str = 'self.' + str if str == 'next'
      super(str)
    end
  end
end
