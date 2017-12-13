require 'nokogiri'
require 'json/ld'
require "multi_json"
require 'nexjsld/utils'

##
# Nexld.nex2ld
#
# Convert NeXML to JSON-LD
module Nexld
  ##
  # Convert NeXML to JSON-LD
  #
  # @param path [String] path to a file with NeXML data
  # @return [Hash] A hash
  #
  # @example
  #      require 'nexldrb'
  #
  #      Nexjsld.nex2ld(path: "eg1.xml")
  def self.nex2ld(path:)
    x = read_disk(path)
    return parse_xml(x)
  end

  private 

  def read_disk(path)
    return File.read(path)
  end

  def parse_xml(x)
    text = read_disk(x)
    xml = Nokogiri.parse(text)
    return xml
  end

end
