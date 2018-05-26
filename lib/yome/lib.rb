module Yome
  class Lib
    def self.ignore?(path)
      path == ".git" || path == "oboe.rb"
    end

    def self.binary?(path)
      s = File.read(path, 1024) or return false
      return s.index("\x00")
    end 
  end
end