module Yome
  class Chip
    attr_reader :kind
    attr_reader :content
    attr_reader :priority

    def initialize(line, index)
      @kind, @content = line.scan(/YOME:([\w.,]*) (.*)/)[0]
      @index = index
  
      # text chip?
      begin 
        @priority = Float(@kind)
        @kind = "text"
      rescue ArgumentError
        # priority is nil
      end
    end
  end
end