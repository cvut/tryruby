require_relative 'spec_helper'
require 'ripl'
require_relative '../lib/tryruby/commands'
require_relative '../lib/tryruby/next_fix'

# mocking shell
module TestShellModule
  class << self; attr_reader :called; end
  @called = {}

  def next_challenge
    TestShellModule.called[:next_challenge] = true
  end

  def prev_challenge
    TestShellModule.called[:prev_challenge] = true
  end

  def help_challenge
    TestShellModule.called[:help_challenge] = true
  end
end

Ripl::Shell.include TestShellModule
Ripl::Shell.include Tryruby::NextFix
Ripl::Commands.include Tryruby::Commands
Ripl.shell.before_loop

describe Tryruby::Commands do
  let(:input) { nil }
  before(:each) do
    TestShellModule.called.clear
    Ripl.shell.eval_input(input)
  end
  subject { TestShellModule.called }
  describe '#next' do
    let(:input) { 'next' }
    it { is_expected.to eq next_challenge: true }
  end

  describe '#back' do
    let(:input) { 'back' }
    it { is_expected.to eq prev_challenge: true }
  end

  describe '#help' do
    let(:input) { 'help' }
    it { is_expected.to eq help_challenge: true }
  end
end
