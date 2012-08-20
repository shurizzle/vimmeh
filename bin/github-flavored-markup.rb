#!/usr/bin/env ruby

begin
  require 'github/markup'
rescue
  exit 1
end

exit 1 if ARGV.size != 1

begin
  html = GitHub::Markup.render(ARGV[0], File.read(ARGV[0]))
  puts '<html><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8"><title>'
  puts ARGV[0]
  puts '</title><style>'
  puts File.read(File.realpath(File.join(__FILE__, '..', 'ghf_marked.css'))) rescue nil
  puts '</style></head><body>'
  puts html
  puts '</body></html>'
rescue
  exit 1
end
