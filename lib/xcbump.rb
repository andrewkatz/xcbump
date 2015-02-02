require "xcbump/version"
require 'plist'
require 'highline/import'
require 'yaml'

module Xcbump
  class Bump
    def configure
      File.write(config_file_path, { project: ask('Project name?  ') }.to_yaml)
      puts "Config file written to '#{config_file_path}'."
    end

    def config_file_path
      File.join(Dir.pwd, 'xcbump.yml')
    end

    def project_name
      @project_name ||= project_name_from_config
    end

    def project_name_from_config
      config = YAML.load(File.read(config_file_path))
      config[:project]
    end

    def bump_version(version_type)
      file_path              = File.join(Dir.pwd, project_name, "#{project_name}-Info.plist")
      info_plist             = Plist::parse_xml(file_path)
      current_version_string = info_plist['CFBundleShortVersionString']
      current_build_string   = info_plist['CFBundleVersion']
      puts "Current version: #{current_version_string} (#{current_build_string})"

      case version_type
      when :major
        version_index = 0
      when :minor
        version_index = 1
      when :patch
        version_index = 2
      else
        version_index = 3
      end

      current_build = current_build_string.split('.').map(&:to_i)
      new_build = []
      current_build.each_index do |index|
        current_number = current_build[index]

        if index < version_index
          new_number = current_number
        elsif index > version_index
          new_number = 0
        else
          new_number = current_number + 1
        end

        new_build[index] = new_number
      end

      new_version_string = new_build[0..-2].join('.')
      new_build_string = new_build.join('.')
      info_plist['CFBundleShortVersionString'] = new_version_string
      info_plist['CFBundleVersion'] = new_build_string

      puts "New version: #{new_version_string} (#{new_build_string})"

      File.write(file_path, info_plist.to_plist)
    end
  end
end
