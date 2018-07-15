require "find"
require 'optparse'
require "yome/lib"
require "yome/parser"
require "yome/writer"
require "yome/version"

module Yome
  class Cli
    def self.exec(argv = [])
      opt = {lang: ""}

      parser = OptionParser.new("Usage: yome [DIR] [options]")
      parser.on('-o FILE', 'Output file name') {|v| opt[:output] = v }
      parser.on('--lang LANG', 'Specify code blocks language') {|v| opt[:lang] = v }
      parser.parse!(argv)

      dir = argv[0] || "."
      main(dir, opt)
    end

    def self.main(dir, opt)
      parser = Parser.new(dir)
      writer = Writer.new(parser, opt[:lang])

      if opt[:output]
        File.write(opt[:output], writer.result)
      else
        puts writer.result
      end
    end
  end
end
  
