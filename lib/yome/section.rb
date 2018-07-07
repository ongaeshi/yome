module Yome
  class Section
    def initialize(chip)
      @section = chip
      @texts = []
    end

    def priority
      @section.priority
    end

    def add_text(chip)
      @texts << chip
    end

    def result(parser)
      <<EOS
# #{@section.content}

\`\`\`
#{parser.file_hash[@section.path][(@section.index + 1)..(@section.index + 8)].join("\n")}
\`\`\`
EOS
    end
  end
end
  
