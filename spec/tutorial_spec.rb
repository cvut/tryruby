require 'tryruby/tutorial'

describe Tryruby::Tutorial do
  subject { described_class.new }

  describe '#[]' do
    it { expect(subject[0]).to eq nil }
  end

  describe '#each' do
    it 'returns Enumerator without block' do
      expect(subject.each.class).to be Enumerator
    end
    it 'iterates through levels' do
      yielded = []
      subject.each { |i| yielded << i }
      expect(yielded).to eq []
    end
  end

  describe '#length' do
    it { expect(subject.length).to eq 0 }
  end

  describe '#commands' do
    it 'return Commands module' do
      expect(subject.commands).to eq described_class::Commands
    end
  end

  context 'subclass' do
    # Tutorial subclass
    class TestTutorial < described_class
      # Test commands
      module Commands
        def test
          'test'
        end
      end
      level do
      end
    end

    subject { TestTutorial.new }

    describe '#[]' do
      it { expect(subject[0].class).to eq Tryruby::Level }
    end

    describe '#each' do
      it 'returns Enumerator without block' do
        expect(subject.each.class).to be Enumerator
      end
      it 'iterates through levels' do
        yielded = []
        subject.each { |i| yielded << i.class }
        expect(yielded).to eq [Tryruby::Level]
      end
    end

    describe '#length' do
      it { expect(subject.length).to eq 1 }
    end

    describe '#commands' do
      it 'return Commands module' do
        expect(subject.commands).to eq TestTutorial::Commands
        expect(subject.commands.instance_methods).to eq [:test]
        expect(described_class.new.commands.instance_methods).to eq []
      end
    end
  end
end
