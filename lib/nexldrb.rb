require "xml/to/hash"
require "multi_json"
require "nexldrb/version"
require "nexldrb/utils"

# @!macro nexldrb_params
#   @param offset [Fixnum] Number of record to start at, any non-negative integer up to 10,000
#   @param limit [Fixnum] Number of results to return. Not relavant when searching with specific dois.
#       Default: 20. Max: 1000
#   @param verbose [Boolean] Print request headers to stdout. Default: false

# @!macro nexldrb_options
#   @param options [Hash] Hash of options for configuring the request, passed on to Faraday.new
#     - timeout [Fixnum] open/read timeout Integer in seconds
#     - open_timeout [Fixnum] read timeout Integer in seconds
#     - proxy [Hash] hash of proxy options
#       - uri [String] Proxy Server URI
#       - user [String] Proxy server username
#       - password [String] Proxy server password
#     - params_encoder [Hash] not sure what this is
#     - bind [Hash] A hash with host and port values
#     - boundary [String] of the boundary value
#     - oauth [Hash] A hash with OAuth details

##
# Phenoscape - The top level module for using methods to access the GBIF API

module Nexld
  ##
  # Convert NeXML to JSON
  #
  # @param path [String] path to a file with NeXML data
  # @return [Hash] json
  #
  # @example
  #      require 'nexldrb'
  #
  #      Nexld.nex2json(path: "eg1.xml")
  def self.nex2json(path:)
    nok = read_xml(path)
    nokhash = nok.to_hash
    return MultiJson.dump(nokhash)
  end

  ##
  # Convert NeXML to JSON-LD
  #
  # Just duplicate of `nex2json` method for now
  #
  # @param path [String] path to a file with NeXML data
  # @return [Hash] json (json-ld)
  #
  # @example
  #      require 'nexldrb'
  #
  #      Nexld.nex2ld(path: "eg1.xml")
  def self.nex2ld(path:)
    nok = read_xml(path)
    nokhash = nok.to_hash
    return MultiJson.dump(nokhash)
  end

end
