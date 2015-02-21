require 'tryruby/challenge_builder'

describe Tryruby::ChallengeBuilder do
  subject { described_class.new }

  it 'passes help' do
    subject.help <<-EOF
HELP! HELP!
I'm being oppressed!
    EOF
    expect(subject.challenge.help).to eq "HELP! HELP!\nI'm being oppressed!\n"
  end

  it 'passes test' do
    called = []
    subject.test do |result, vars, out|
      called << [self, result, vars, out]
      true
    end
    expect(subject.challenge.test('self', 42, { foo: 'bar' }, '')).to eq true
    expect(called).to eq [['self', 42, { foo: 'bar' }, '']]
  end

  it 'passes setup' do
    called = []
    subject.setup do |vars|
      called << [self, vars]
      true
    end
    expect(subject.challenge.setup('self', foo: 'bar')).to eq true
    expect(called).to eq [['self', foo: 'bar']]
  end

  it 'passes display_setup' do
    subject.display_setup true
    expect(subject.challenge.display_setup).to eq true
  end
end
