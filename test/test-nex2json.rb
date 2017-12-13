require 'simplecov'
SimpleCov.start
if ENV['CI']=='true'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

require "nexldrb"
require 'fileutils'
require "test/unit"

class TestNex2json < Test::Unit::TestCase

  def test_nex2json
    res = Nexld.nex2json(path: "eg1.xml")
    assert_true(res.length > 100)
    assert_equal(String, res.class)
    assert_match(/\{/, res)
  end

end
