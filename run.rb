require "thor"
require 'yaml'
require 'fileutils'

require_relative "./lib/amanda"


class Amanda < Thor
  desc 'init', 'create amanda.yaml file'
  def init
    if File.exist?('amanda.yaml')
      puts 'amanda.yaml cannot be created because it already exists!'
    end
    FileUtils.touch 'amanda.yaml'
  end
  desc 'migrate', 'migrate tables to database'
  def migrate
    file = YAML.load_file('amanda.yaml')
    file["tables"].each do | table_name, columns |
      print create_table(table_name, columns)
    end    
  end
end

Amanda.start(ARGV)
