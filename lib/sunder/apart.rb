#!/usr/bin/env ruby
# frozen string literal: true

require 'fileutils'
require 'thor'
require 'yaml'

module Sunder
  class Apart
    def initialize(config_file, input_source)
      @input_file = input_source
      @metadata = load_yaml_file(config_file)
      @album_title = return_formatted_title('My Album',
                                            'year',
                                            'album_artist',
                                            'title')
      format = get_field("format")
      @output_format = format.empty? ? "mp3" : get_field("format").empty?

      make_album_directory
      parse_track_info
    end

    def get_field(name)
      @metadata[name.to_s] || ""
    end

    def load_yaml_file(filename)
      File.open(filename) { |f| YAML::load(f) }
    rescue
      'Cannot parse configuration file.'
    end

    def make_album_directory
      puts "Making directory #{@album_title}"
      FileUtils.mkdir_p(@album_title)
    end

    def make_track(skip_time,track_length,track_end,track_name)
      puts "Making track #{track_name} of length #{track_length} seconds."

      ffmpeg_command = "ffmpeg -loglevel 8 " \
                       "-i #{@input_file} " \
                       "-ss #{skip_time} -to #{track_end} " \
                       "\"#{@album_title}/#{track_name}.#{@output_format}\""

      system(ffmpeg_command)
    end

    def parse_track_info
      tracks = get_field("tracks")
      track_num = 1
      skip_time = 0.0
      return "Nothing to do" if tracks.empty?

      tracks.each do |k,v|
        track_end = timestamp_to_seconds(k)
        track_length = track_end - skip_time
        track_name = "#{"%02d" % track_num}. #{v}"

        make_track(skip_time, track_length, track_end, track_name)

        track_num += 1
        skip_time += track_length
      end

      puts "Total Album Length: #{skip_time}"
    end

    def return_formatted_title(default, *fields)
      title = fields.map { |f| get_field(f).to_s }

      title = title.reject { |f| f.empty? }.join(' - ')

      title.empty? ? default : title
    end

    def timestamp_to_seconds(timestamp)
      parsed_timestamp = timestamp.to_s.split(':')

      parsed_timestamp.reverse.map.with_index { |n,i|
        n.to_f * (60**i)
      }.sum
    end
  end
end
