require_relative 'spec_helper'
require_relative '../lib/tryruby/challenge'

describe Tryruby::Challenge do
  let(:help) { '' }
  let(:test) { nil }
  let(:setup) { nil }
  let(:display_setup) { false }

  subject { described_class.new(help, test, setup, display_setup) }

  describe '#help' do
    let(:help) { 'This is help' }
    it 'returns help' do
      expect(subject.help).to eq 'This is help'
    end
  end

  describe '#test' do
    context 'non-empty test' do
      called = []
      let(:test) do
        proc do |res, vars, out|
          called << self << res << vars.clone << out
          vars[:foobar] = 24
          true
        end
      end

      it 'runs the test' do
        expect(subject.test('self', 42, vars = { foo: 'bar' }, '')).to eq true
        expect(called).to eq ['self', 42, { foo: 'bar' }, '']
        expect(vars[:foobar]).to eq 24
      end
    end

    context 'empty test' do
      it 'returns nil' do
        expect(subject.test(nil, nil, {}, '')).to eq nil
      end
    end
  end

  describe '#setup' do
    context 'non-empty setup' do
      called = []
      let(:setup) do
        proc do |vars|
          called << self << vars.clone
          vars[:foobar] = 24
          true
        end
      end

      it 'runs the setup' do
        expect(subject.setup('self', vars = { foo: 'bar' })).to eq true
        expect(called).to eq ['self', { foo: 'bar' }]
        expect(vars[:foobar]).to eq 24
      end
    end

    context 'empty setup' do
      it 'returns nil' do
        expect(subject.setup(nil, {})).to eq nil
      end
    end
  end

  describe '#setup_source' do
    let(:setup) do
      proc do |vars|
        puts 42
        vars[:foo] = vars[:bar]
      end
    end

    it 'formats setup source' do
      expect(subject.setup_source).to eq <<-EOS
puts(42)
foo = bar
      EOS
    end
  end

  describe '#display_setup' do
    let(:display_setup) { true }
    it 'returns display_setup' do
      expect(subject.display_setup).to eq true
    end
  end
end
