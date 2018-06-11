module Yome
  class Chip
    attr_reader :kind
    attr_reader :content
    attr_reader :priority
    attr_reader :path
    attr_reader :index

    def initialize(line, path, index)
      @kind, @content = line.scan(/YOME:([\w.,]*) (.*)/)[0]
      @path = path
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