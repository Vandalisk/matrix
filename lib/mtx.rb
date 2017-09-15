require "dotenv/load"
require "httparty"
require "active_support/all"

require "mtx/util"
require "mtx/matrix_gateway"
require "mtx/sorter"
require "mtx/parser"
require "mtx/zion_envelope"

require "mtx/config"

Mtx::Config::SOURCE_NAMES.each do |src|
  require "mtx/parser/#{src.singularize}"
end

module Mtx
  def self.call
    gateway = MatrixGateway.new
    gateway.perform
    sorter = Sorter.new
    sorter.perform
    gateway.send(sorter.results)

    result = sorter.success ? 'OK' : 'failure'

    puts result

    result
  end
end
