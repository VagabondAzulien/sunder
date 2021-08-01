# frozen string literal: true

require 'yaml'

module Sunder
  class Utils
    def self.verify_config_file(config_file)
      metadata = File.open(config_file) { |f| YAML::load(f) }
      return false unless metadata.keys.include?("tracks")
    rescue
      puts 'Cannot load configuration file'
      return false
    else
      return true
    end
  end
end
