require "test_helper"

class ChipTest < Minitest::Test
  include Yome

  def test_initialize
    chip = Chip.new
    refute_nil chip
  end
end
