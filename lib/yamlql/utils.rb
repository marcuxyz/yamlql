require 'yaml'

require_relative 'normalize'


def mount table_name, columns
  query = ''
  normalize = Normalize.new
  columns.each do | name, types |
    text = "#{name} #{types.join(' ')}, "
    query << normalize.text(text)
  end
  text = 'CREATE TABLE if not exists %s (%s);' % [table_name, query]
  return text.gsub! ', )', ')'
end


def load_yaml_file filename
  return YAML.load_file("yamlql/#{filename}.yaml")
end
