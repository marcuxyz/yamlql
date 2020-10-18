require 'pg'

require_relative 'base'


class PostgresSQL < Base
  def initialize credentials
    @dbname = credentials["dbname"]
    @host = credentials["host"]
    @user = credentials["user"]
    @password = credentials["password"]
    @port = credentials["port"]

  end
  def create query
    conn = PG.connect( 
      :dbname => @dbname,
      :user => 'postgres',
      :password => @password,
    )

    begin
      puts query
      conn.exec(query)
    rescue PG::Error => err
      $stderr.puts "%p while we creating your tables: %s" % [ err.class, err.message ]
      conn.reset
    end
  end
end