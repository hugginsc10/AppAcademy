require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    where_line = params.keys.map { |key| "#{key} = ?" }.join(" AND ") #looking at params hash for the keys for the where search --splat is used incase there are multiple parameters in Where query
    result = DBConnection.execute(<<-SQL, *params.values) 
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        #{where_line}
    SQL
    parse_all(result)
  end
end

class SQLObject
  extend Searchable
end
