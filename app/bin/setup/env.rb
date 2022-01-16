require 'pg'
# !/usr/bin/env sh
set(-e)

require 'pg'

begin
  con = PG.connect dbname: 'ibge', user: 'postgres'
  puts con.server_version
rescue PG::Error => e
  puts e.message
ensure
  con.close if con
end
