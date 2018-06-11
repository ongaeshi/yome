module Yome
  class Writer
    def initialize(parser)
      parser.chips.each do |e|
        case e.kind
        when "title"
          @title = e.content
        when "summary"
          @summary = e.content
        when "url"
          @url = e.content
        end
      end
    end

    def result
      <<EOS
\# #{@title}
#{@summary}

#{@url}
EOS
    end
  end
end
  
