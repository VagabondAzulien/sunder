#!/usr/bin/env ruby
# frozen string literal: true

require 'thor'

Dir[File.join(__dir__, 'sunder', '*.rb')].each { |file| require file }

class SunderCLI < Thor
  desc 'apart CONFIG SOURCE', 'Sunder the SOURCE based on the CONFIG file'
  def apart(config_file, input_source)
    exit unless Sunder::Utils.verify_config_file(config_file)
    Sunder::Apart.new(config_file, input_source)
  end
end
