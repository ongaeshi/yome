module Yome
  class Section
    attr_reader :section

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

#{src_code(parser, @section, false)}

#{@texts.map { |e| src_code(parser, e, true) }.join("\n")}
EOS
    end

    private

    def src_code(parser, chip, with_text)
      r = []

      if with_text
        r << chip.content
        r << ""
      end 

      r << "```"
      r << parser.file_hash[chip.path][(chip.index + 1)..(chip.index + 8)].join("\n")
      r << "```"

      r.join("\n")
    end
  end
end
  
