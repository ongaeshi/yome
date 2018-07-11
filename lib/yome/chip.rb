module Yome
  class Chip
    attr_reader :kind
    attr_reader :content
    attr_reader :priority
    attr_reader :path
    attr_reader :index
    attr_reader :end_index

    def initialize(line, path, index)
      @kind, @content = line.scan(/YOME:([\w.,]*) *(.*)/)[0]
      @path = path
      @index = index

      if @kind == ""
        @kind = "text"
      else
        # section?
        begin 
          @priority = Float(@kind)
          @kind = "section"
        rescue ArgumentError
        end
      end
    end

    def parse(parser)
      file = parser.file_hash[path]

      i = index + 1
      while i < file.length do
        if file[i] =~ /YOME:([\w.,]*) *(.*)/
          truncate_using_end = true if $1 == "end"
          break
        end
        i += 1
      end

      @end_index = i - 1

      unless truncate_using_end
        @end_index = [end_index, index + 8].min
      end
    end

    def has_src?
      index < end_index
    end
  end
end