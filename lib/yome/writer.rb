module Yome
  class Writer
    def initialize(parser)
      @title = "NO TITLE"
      @parser = parser
      @pargraphs = []

      parser.chips.each do |e|
        case e.kind
        when "title"
          @title = e.content
        when "summary"
          @summary = e.content
        when "url"
          @url = e.content
        when "section"
          @pargraphs << e
        else
          # p e
        end
      end
    end

    def join_paragraphs
      str = ""
      path = nil
      
      @pargraphs.sort_by { |e| e.priority }.each do |e|
        str += "## #{e.content}\n"
        path = e.path

        str += <<EOS

\`\`\`
#{@parser.file_hash[e.path][(e.index + 1)..(e.index + 8)].join("\n")}
\`\`\`

EOS
      end

      str
    end

    def result
      <<EOS
\# #{@title}
#{@summary}

#{@url}

#{join_paragraphs}
EOS
    end
  end
end
  
