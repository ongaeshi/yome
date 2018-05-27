require "yome/version"
require "yome/lib"
require "find"
require "thor"

module Yome
  class Cli < Thor
    desc "show DIR", "Show result."
    def show(dir = ".")
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

    desc "gen DIR", "Generate YOME.md"
    def gen(dir = ".")
      # Save to file
    end
  end
end
  
