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

    def result(parser, lang)
      <<EOS
## #{@section.content}
*#{@section.path}*

#{src_code(parser, @section, false, lang)}

#{@texts.map { |e| src_code(parser, e, true, lang) }.join("\n")}
EOS
    end

    private

    def src_code(parser, chip, with_text, lang)
      lang = detect_lang if lang.empty?
      r = []

      if with_text
        r << chip.content
      end
      
      if chip.has_src?
        r << ""
        r << "```#{lang}"
        r << parser.file_hash[chip.path][(chip.index + 1)..(chip.end_index)].join("\n")
        r << "```"
      end

      r.join("\n")
    end

    LANG_HASH = {
      ".c" => "c",
      ".cpp" => "cpp",
      ".cs" => "csharp",
      ".go" => "golang",
      ".h" => "cpp",
      ".hpp" => "cpp",
      ".js" => "javascript",
      ".py" => "python",
      ".rb" => "ruby",
      ".sh" => "bash",
    }

    def detect_lang
      ext = File.extname(@section.path)
      LANG_HASH[ext]
    end
  end
end
  
