require_relative 'normalize'

def create_table table_name, columns
  query = ''
  normalize = Normalize.new
  columns.each do | name, types |
    text = "#{name} #{types.join(' ')}, "
    query << normalize.text(text)
  end
  text = 'CREATE TABLE if not exists %s (%s);' % [table_name, query]
  return text.gsub! ', )', ')'
end

