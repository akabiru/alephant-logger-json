require_relative 'json'
require 'json'

module Alephant
  module Logger
    class JSONtoIO < Alephant::Logger::JSON
      attr_reader :output

      def initialize(output, options = {})
        @output            = output
        @nesting           = options.fetch(:nesting, false)
        @write_level       = options.fetch(:level, :debug)
        self.class.session = -> { 'n/a' } unless self.class.session?
      end

      private

      def write(hash)
        output.puts(::JSON.generate(hash))
      end
    end
  end
end
