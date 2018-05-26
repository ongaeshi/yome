require "yome/version"
require "yome/lib"
require "find"

module Yome
  class Cli
    def self.start(argv)
      if argv.length == 1
        find(argv[0])
      else
        puts "yome [DIR]"
      end
    end

    def self.find(dir)
      Find.find(dir) do |path|
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
  
