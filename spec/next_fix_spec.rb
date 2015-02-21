require 'tryruby/next_fix'

describe Tryruby::NextFix do
  # mocking module to properly inherit
  module API
    def loop_eval(str)
      str
    end
  end

  include API
  include described_class

  it 'converts next to self.next' do
    expect(loop_eval('next')).to eq 'self.next'
  end

  it 'does not convert "next"' do
    expect(loop_eval('"next"')).to eq '"next"'
  end
end
