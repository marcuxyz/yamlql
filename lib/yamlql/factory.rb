require_relative 'database/postgres'
require_relative 'utils'


def factory dialect
  config = load_yaml_file('config')
  migrations = load_yaml_file('migration')
  
  query = ''

  # this will interact with the table section
  migrations.each do | table_name, columns |
    query << mount(table_name, columns)
  end 

  case dialect
  when 'pg'
    pg = PostgresSQL.new(config)
    pg.create query
  else
    puts 'You can only use "pg" or "mysql" dialect, please change in yamlql/migration.yaml file'    
  end
end
