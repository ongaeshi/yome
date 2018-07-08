module Yome
  class Chip
    attr_reader :kind
    attr_reader :content
    attr_reader :priority
    attr_reader :path
    attr_reader :index

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
  end
end