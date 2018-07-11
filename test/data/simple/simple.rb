# YOME:title Yome simple test
# YOME:summary This is a simple sample
# YOME:url https://github.com/ongaeshi/yome/tree/master/test/data/simple

# YOME:4 require
require "dir"

# YOME:1 Define class
class Simple
  # YOME:3 attr_reader
  attr_reader :x

  # YOME:1.1 Initialize
  def initialize(x)
    @x = x
  end

  # YOME:2 Method
  # YOME: 2, 3, 4, ...
  def to_double
    2 * x
  end

  # YOME: tripple
  def to_tripple
    3 * x
  end
end