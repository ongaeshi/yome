require "find"
require "thor"
require "yome/lib"
require "yome/parser"
require "yome/version"

module Yome
  class Cli < Thor
    desc "show DIR", "Show result."
    def show(dir = ".")
      Parser.new(dir)
    end

    desc "gen DIR", "Generate YOME.md"
    def gen(dir = ".")
      # Save to file
    end
  end
end
  
