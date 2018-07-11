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
  # YOME: The *to_double* method doubles x and returns it.
  # YOME: double
  def to_double
    2 * x
  end

  # YOME: tripple
  def to_tripple
    3 * x
  end

  # YOME:5 YOME:end
  # YOME: You can display long distance with `YOME:end`.
  def long_method
    1 +
    2 +
    3 +
    4 +
    5 + 
    6 +
    7 +
    8 +
    9 +
    10
  end
  # YOME:end

  # YOME:6 Default distance is 8
  def long_method2
    1 +
    2 +
    3 +
    4 +
    5 + 
    6 +
    7 +
    8 +
    9 +
    10
  end
end