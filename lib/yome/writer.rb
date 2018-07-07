require 'yome/section'

module Yome
  class Writer
    def initialize(parser)
      @title = "NO TITLE"
      @parser = parser
      @sections = []

      parser.chips.each do |e|
        case e.kind
        when "title"
          @title = e.content
        when "summary"
          @summary = e.content
        when "url"
          @url = e.content
        when "section"
          @sections << Section.new(e)
        else
          # p e
        end
      end
    end

    def header
      str = ""
      str += "#{@summary}\n\n" if @summary
      str += "#{@url}\n\n" if @url
    end

    def sections
      @sections.sort_by { |e| e.priority }.map do |e|
        e.result(@parser)
      end.join("\n")
    end

    def result
      <<EOS
\# #{@title}
#{header}
#{sections}
EOS
    end
  end
end
  
