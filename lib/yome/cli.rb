require "find"
require "thor"
require "yome/lib"
require "yome/parser"
require "yome/writer"
require "yome/version"

module Yome
  class Cli < Thor
    desc "show DIR", "Show result."
    def show(dir = ".")
      parser = Parser.new(dir)
      writer = Writer.new(parser)
      puts writer.result
    end

    desc "gen DIR", "Generate YOME.md"
    def gen(dir = ".")
      # Save to file
    end
  end
end
  
