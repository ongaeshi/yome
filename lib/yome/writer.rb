module Yome
  class Writer
    def initialize(parser)
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
        when "text"
          @pargraphs << e
        end
      end
    end

    def join_paragraphs
      @pargraphs.map do |e|
        <<EOS
\#\# #{e.path}
#{e.content}

\`\`\`
#{@parser.file_hash[e.path][e.index + 1]}
\`\`\`
EOS
      end.join("\n")
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
  
