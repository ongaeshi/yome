require "yome/version"
require "yome/lib"
require "find"

module Yome
  class Cli
    def self.start(argv)
      Find.find(ARGV[0]) do |path|
        Find.prune if Lib::ignore?(File.basename(path))
        next if FileTest.directory?(path) || Lib::binary?(path)
        
        open(path) do |io|
          io.each_line do |line|
            if line =~ /YOME:/
              puts "--- #{path} ---"
              puts "#{io.lineno}: #{line}"
            end
          end
        end
      end
    end 
  end
end
  
