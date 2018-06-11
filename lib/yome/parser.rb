require "yome/lib"

module Yome
  class Parser
    def initialize(dir)
      @file_hash = {}
      @chips = []

      collect_chips(dir)

      p @file_hash.keys
      p @chips
    end

    def collect_chips(dir)
      Find.find(dir) do |path|
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
            @chips << Chip.new(line, i)
          end
        end 
      end
    end
  end
end
  
