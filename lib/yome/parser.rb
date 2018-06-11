require "yome/lib"
require "pathname"

module Yome
  class Parser
    attr_reader :file_hash, :chips

    def initialize(dir)
      @file_hash = {}
      @chips = []

      collect_chips(dir)
    end

    def collect_chips(dir)
      Dir.chdir(dir) do
        Find.find(".") do |path|
          Find.prune if Lib::ignore?(File.basename(path))
          next if FileTest.directory?(path) || Lib::binary?(path)
  
          begin
            contents = File.read(path).split("\n")
          rescue ArgumentError
            puts "Skip #{path}"
            next
          end
  
          contents.each_with_index do |line, i|
            if line =~ /YOME:/
              path = path.gsub(/^\.\//, "")
              @file_hash[path] = contents
              @chips << Chip.new(line, path, i)
            end
          end 
        end
      end
    end
  end
end
  
