module Yome
  class Writer
    def initialize(parser)
      parser.chips.each do |e|
        case e.kind
        when "title"
          @title = e.content
        end
      end
    end

    def result
      <<EOS
\# #{@title}
EOS
    end
  end
end
  
