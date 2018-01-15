# frozen_string_literal: true

require 'yaml'
require 'pry'
require_relative 'logger_wrapper'

module ParseData

  def self.parsed_yaml_file_data(file_path)
    YAML.load_file(File.open(file_path))
  rescue ArgumentError => e
    LoggerWrapper.logger.info "Could not parse YAML: #{e.message}"
  end

end