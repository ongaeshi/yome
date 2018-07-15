require "test_helper"

class ChipTest < Minitest::Test
  include Yome

  def test_show_simple
    Cli.new.show("test/data/simple")
  end
end
