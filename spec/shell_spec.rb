require 'tryruby/challenge'
require 'tryruby/shell'

# mocking shell
class TestShell
  class << self; public :include; end

  def initialize
    @binding = create_binding
    @result = false
  end

  # mocking module to properly inherit
  module API
    def before_loop
    end

    def loop_once
    end
  end

  def create_binding
    foo = 42
    bar = 24
    binding
  end

  include API
end

TestShell.include Tryruby::Shell

describe Tryruby::Shell do
  called = []
  let(:test) do
    proc do |result, vars, output|
      called << [:test, self, result, vars.dup, output]
      result
    end
  end
  let(:setup) do
    proc do |vars|
      called << [:setup, self, vars.dup]
      vars[:test_var] ||= 0
      vars[:test_var] += 1
    end
  end
  let(:a) { Tryruby::Challenge.new('a', test, setup) }
  let(:b) { Tryruby::Challenge.new('b', nil, setup) }
  let(:c) { Tryruby::Challenge.new('c', test) }
  let(:levels) { [[a, b], [], [c]] }
  let(:shell) { TestShell.new.tap { |sh| sh.levels = levels } }

  def test_var
    eval('test_var', shell.instance_eval('@binding'))
  end

  subject { shell.challenge }

  before(:each) do
    called = []
    shell.before_loop
  end

  describe '#before_loop' do
    it 'prints help and calls setup' do
      is_expected.to eq a
      expect(called).to eq [[:setup, shell, { foo: 42, bar: 24 }]]
      expect(test_var).to eq 1
    end
  end

  describe '#next_challenge' do
    let(:test) {}
    it 'prints helps and calls setups' do
      expect do
        shell.next_challenge
        shell.loop_once
      end.to match_stdout('b')
      expect(shell.challenge).to eq b
      expect(test_var).to eq 2
      expect do
        shell.next_challenge
        shell.loop_once
      end.to match_stdout('c')
      expect(shell.challenge).to eq c
      expect(test_var).to eq 2
      expect do
        shell.next_challenge
        shell.loop_once
      end.to throw_symbol(:ripl_exit)
      expect(shell.challenge).to eq nil
      expect(test_var).to eq 2
      expect(called).to eq [
        [:setup, shell, { foo: 42, bar: 24 }],
        [:setup, shell, { foo: 42, bar: 24, test_var: 1 }]
      ]
    end
  end

  describe '#prev_challenge' do
    let(:test) {}
    it 'prints helps and calls setups' do
      2.times do
        shell.next_challenge
        shell.loop_once
      end
      expect(shell.challenge).to eq c
      expect(test_var).to eq 2
      expect do
        shell.prev_challenge
        shell.loop_once
      end.to match_stdout('b')
      expect(shell.challenge).to eq b
      expect(test_var).to eq 3
      expect do
        shell.prev_challenge
        shell.loop_once
      end.to match_stdout('a')
      expect(shell.challenge).to eq a
      expect(test_var).to eq 4
      expect do
        shell.prev_challenge
        shell.loop_once
      end.to match_stdout('')
      expect(shell.challenge).to eq a
      expect(test_var).to eq 4
      expect(called).to eq [
        [:setup, shell, { foo: 42, bar: 24 }],
        [:setup, shell, { foo: 42, bar: 24, test_var: 1 }],
        [:setup, shell, { foo: 42, bar: 24, test_var: 2 }],
        [:setup, shell, { foo: 42, bar: 24, test_var: 3 }]
      ]
    end
  end

  describe '#loop_once' do
    context 'with fulfilled test' do
      let(:test) do
        proc do |result, vars, output|
          called << [:test, self, result, vars, output]
          !result
        end
      end
      it 'goes to next challenge' do
        expect { shell.loop_once }.to match_stdout('Success!')
        expect(called).to eq [
          [:setup, shell, { foo: 42, bar: 24 }],
          [:test, shell, false, { foo: 42, bar: 24, test_var: 1 }, ''],
          [:setup, shell, { foo: 42, bar: 24, test_var: 1 }]
        ]
        expect(shell.challenge).to eq b
      end
    end
    context 'with failed test' do
      it 'does not go to next challenge' do
        expect { shell.loop_once }.to match_stdout('')
        expect(called).to eq [
          [:setup, shell, { foo: 42, bar: 24 }],
          [:test, shell, false, { foo: 42, bar: 24, test_var: 1 }, '']
        ]
        expect(shell.challenge).to eq a
      end
    end
  end

  describe '#level' do
    it 'returns current level\'s challenges' do
      expect(shell.level).to eq [a, b]
    end
  end

  describe '#challenge' do
    it 'returns current challenge' do
      is_expected.to eq a
    end
  end

  describe '#help_challenge' do
    it 'prints help' do
      expect { shell.help_challenge }.to match_stdout('a')
    end
  end

  context 'without challenge' do
    let(:levels) { [] }

    describe '#loop_once' do
      it { expect { shell.loop_once }.to throw_symbol(:ripl_exit) }
    end

    describe '#level' do
      it { expect(shell.level).to eq nil }
    end

    describe '#challenge' do
      it { is_expected.to eq nil }
    end

    describe '#help_challenge' do
      it { expect { shell.help_challenge }.to match_stdout('') }
    end
  end
end
