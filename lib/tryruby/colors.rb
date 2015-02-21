require 'paint'

module Tryruby
  # ANSI formatting shortcuts
  module Colors
    Paint::SHORTCUTS[:tryruby] = {
      black: Paint.color(:black),
      red: Paint.color(:red),
      green: Paint.color(:green),
      yellow: Paint.color(:yellow),
      blue: Paint.color(:blue),
      magenta: Paint.color(:magenta),
      cyan: Paint.color(:cyan),
      white: Paint.color(:white),
      bg_black: Paint.color(nil, :black),
      bg_red: Paint.color(nil, :red),
      bg_green: Paint.color(nil, :green),
      bg_yellow: Paint.color(nil, :yellow),
      bg_blue: Paint.color(nil, :blue),
      bg_magenta: Paint.color(nil, :magenta),
      bg_cyan: Paint.color(nil, :cyan),
      bg_white: Paint.color(nil, :white),
      reset: Paint.color(:reset),
      bold: Paint.color(:bold),
      underline: Paint.color(:underline),
      inverse: Paint.color(:inverse),
      hide: Paint.color(:hide),
      title: Paint.color(:bold, :underline),
      result: Paint.color(:blue),
      error: Paint.color(:red, :bold),
      success: Paint.color(:green, :bold)
    }

    include Paint::Tryruby

    def paint(*args)
      Paint[*args]
    end

    module_function(*Paint::SHORTCUTS[:tryruby].keys)
    module_function :paint
  end
end
