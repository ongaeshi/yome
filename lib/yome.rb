require "yome/version"
require "find"

module Yome
  def self.ignore?(path)
    path == ".git" || path == "oboe.rb"
  end
end
  
Find.find(ARGV[0]) do |path|
  Find.prune if Yome::ignore?(File.basename(path))
  next if FileTest.directory?(path)
  
  open(path) do |io|
    io.each_line do |line|
      if line =~ /YOME:/
        puts "--- #{path} ---"
        puts "#{io.lineno}: #{line}"
      end
    end
  end
end
