#!/usr/bin/env ruby
require 'optparse'

options = {}
parser = OptionParser.new do |opts|
  opts.on('-w', '--width WIDTH',
          OptionParser::DecimalInteger,
          'Screen width (required).') do |w|
    options[:width] = w
  end
  opts.on('-h', '--height HEIGHT',
          OptionParser::DecimalInteger,
          'Screen height (required).') do |h|
    options[:height] = h
  end
  opts.on('-m', '--minimum MINIMUM',
          OptionParser::DecimalInteger,
          'Minimum thumbnail size (default 60).') do |min|
    options[:minimum] = min
  end
  opts.on('-x', '--maximum MAXIMUM',
          OptionParser::DecimalInteger,
          'Maximum thumbnail size.') do |max|
    options[:maximum] = max
  end
  opts.on('-l', '--list LENGTH',
          OptionParser::DecimalInteger,
          'Number of entries to list (default 40).') do |len|
    options[:length] = len
  end
  opts.on_tail('--help', 'Print help.') do
    puts opts
    exit
  end
end

begin
  parser.parse ARGV
rescue
  abort(parser.help)
end

w, h = options[:width], options[:height]

if w.nil? or h.nil? or (w < 0) or (h < 0)
  abort(parser.help)
end

max = options[:maximum] || [w, h].min
min = options[:minimum] || 60
len = options[:length]  || 40

min = [min, 1].max

# thumbnail margin + padding + border
mpb = ->(n) { [(((n - 1) >> 5) + 1), 4].min * 2 + 6 }

f = ->(x) {
  n = x + mpb.call(x)
  [(w % n) * h + (h % n) * w, x]
}

(min .. max).map(&f).sort.first(len).each do |t|
  puts "Thumbnail size:\s#{t[1]}\tEmpty space:\s#{t[0]}"
end

