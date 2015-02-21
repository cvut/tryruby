require 'stringio'
require 'tryruby'

Dir['./spec/support/**/*.rb'].each { |file| require file }

RSpec.configure do |c|
  c.color = true
  c.formatter = :documentation
  c.tty = true
end
