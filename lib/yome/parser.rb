require "yome/lib"

module Yome
  class Parser
    def initialize(dir)
      Find.find(dir) do |path|
        Find.prune if Lib::ignore?(File.basename(path))
        next if FileTest.directory?(path) || Lib::binary?(path)
        
        contents = File.read(path).split("\n")

        contents.each_with_index do |line, i|
          if line =~ /YOME:/
            puts "--- #{path.gsub(/^\.\//, "")} ---"
            puts "#{i + 1}: #{line}"
          end
        end 
      end
    end
  end
end
  
