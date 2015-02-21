require 'paint'
require 'tryruby/colors'

describe Tryruby::Colors do
  let(:string) { 'test' }
  subject { described_class }

  context 'module' do
    it 'formats strings' do
      expect(subject.black(string)).to eq Paint[string, :black]
      expect(subject.red(string)).to eq Paint[string, :red]
      expect(subject.green(string)).to eq Paint[string, :green]
      expect(subject.yellow(string)).to eq Paint[string, :yellow]
      expect(subject.blue(string)).to eq Paint[string, :blue]
      expect(subject.magenta(string)).to eq Paint[string, :magenta]
      expect(subject.cyan(string)).to eq Paint[string, :cyan]
      expect(subject.white(string)).to eq Paint[string, :white]
      expect(subject.bg_black(string)).to eq Paint[string, nil, :black]
      expect(subject.bg_red(string)).to eq Paint[string, nil, :red]
      expect(subject.bg_green(string)).to eq Paint[string, nil, :green]
      expect(subject.bg_yellow(string)).to eq Paint[string, nil, :yellow]
      expect(subject.bg_blue(string)).to eq Paint[string, nil, :blue]
      expect(subject.bg_magenta(string)).to eq Paint[string, nil, :magenta]
      expect(subject.bg_cyan(string)).to eq Paint[string, nil, :cyan]
      expect(subject.bg_white(string)).to eq Paint[string, nil, :white]
      expect(subject.reset(string)).to eq Paint[string, :reset]
      expect(subject.bold(string)).to eq Paint[string, :bold]
      expect(subject.underline(string)).to eq Paint[string, :underline]
      expect(subject.inverse(string)).to eq Paint[string, :inverse]
      expect(subject.hide(string)).to eq Paint[string, :hide]
      expect(subject.title(string)).to eq Paint[string, :bold, :underline]
      expect(subject.result(string)).to eq Paint[string, :blue]
      expect(subject.error(string)).to eq Paint[string, :red, :bold]
      expect(subject.success(string)).to eq Paint[string, :green, :bold]
    end
  end

  context 'included' do
    include described_class
    it 'formats strings' do
      expect(black(string)).to eq Paint[string, :black]
      expect(red(string)).to eq Paint[string, :red]
      expect(green(string)).to eq Paint[string, :green]
      expect(yellow(string)).to eq Paint[string, :yellow]
      expect(blue(string)).to eq Paint[string, :blue]
      expect(magenta(string)).to eq Paint[string, :magenta]
      expect(cyan(string)).to eq Paint[string, :cyan]
      expect(white(string)).to eq Paint[string, :white]
      expect(bg_black(string)).to eq Paint[string, nil, :black]
      expect(bg_red(string)).to eq Paint[string, nil, :red]
      expect(bg_green(string)).to eq Paint[string, nil, :green]
      expect(bg_yellow(string)).to eq Paint[string, nil, :yellow]
      expect(bg_blue(string)).to eq Paint[string, nil, :blue]
      expect(bg_magenta(string)).to eq Paint[string, nil, :magenta]
      expect(bg_cyan(string)).to eq Paint[string, nil, :cyan]
      expect(bg_white(string)).to eq Paint[string, nil, :white]
      expect(reset(string)).to eq Paint[string, :reset]
      expect(bold(string)).to eq Paint[string, :bold]
      expect(underline(string)).to eq Paint[string, :underline]
      expect(inverse(string)).to eq Paint[string, :inverse]
      expect(hide(string)).to eq Paint[string, :hide]
      expect(title(string)).to eq Paint[string, :bold, :underline]
      expect(result(string)).to eq Paint[string, :blue]
      expect(error(string)).to eq Paint[string, :red, :bold]
      expect(success(string)).to eq Paint[string, :green, :bold]
    end
  end
end
