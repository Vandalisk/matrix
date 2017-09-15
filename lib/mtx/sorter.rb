module Mtx
  class Sorter < Util
    def perform
      for_each_source do |src|
        parsed_data(src)
      end
      @success = @results.any?
    end

    private

    def for_each_source
      Config::SOURCE_NAMES.each do |src|
        yield(src)
      end
    end

    def parsed_data(src)
      src_dir = File.expand_path("../../../tmp/#{src}", __FILE__)
      return unless Dir.exist?(src_dir)
      klass = "Mtx::Parser::#{src.singularize.titleize}".constantize
      parser = klass.new(src)
      parser.parse
      @results += parser.results
    end
  end
end
