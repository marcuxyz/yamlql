require 'logger'
require 'fileutils'
require 'yaml'
require 'thor'

require_relative 'yamlql/utils'
require_relative "yamlql/factory"


class YamlQL < Thor
  desc 'init', 'create migration.yaml file'
  def init
    logger = Logger.new(STDOUT)
    if File.exist?('./yamlql/migration.yaml')
      logger.error 'migration.yaml cannot be created because it already exists!'
    end
    Dir.mkdir 'yamlql'
    FileUtils.touch 'yamlql/migration.yaml'
    puts 'migration.yaml created successfully'
  end
  
  desc 'migrate', 'migrate tables to database'
  def migrate
    factory load_yaml_file('config')['dialect']
  end
end

YamlQL.start(ARGV)