require 'tryruby/challenge'
require 'tryruby/level'

describe Tryruby::Level do
  let(:a) { Tryruby::Challenge.new('a') }
  let(:b) { Tryruby::Challenge.new('b') }
  subject { described_class.new(a, b) }

  describe '#[]' do
    it 'returns proper item' do
      expect(subject[0]).to eq a
      expect(subject[1]).to eq b
    end
  end

  describe '#each' do
    it 'iterates through items' do
      yielded = []
      subject.each { |i| yielded << i }
      expect(yielded).to eq [a, b]
    end
  end

  describe '#length' do
    it 'returns number of items' do
      expect(subject.length).to eq 2
    end
  end
end
