require_relative 'spec_helper'
require_relative '../lib/tryruby/level_builder'

describe Tryruby::LevelBuilder do
  subject { described_class.new }

  describe '#challenge' do
    it 'adds challenges' do
      subject.challenge do
        help 'first'
      end
      subject.challenge do
        help 'second'
      end
      level = subject.level
      expect(level[0].help).to eq 'first'
      expect(level[1].help).to eq 'second'
      expect(level.length).to eq 2
    end
  end
end
