require_relative '03_associatable'

# Phase IV
module Associatable
  # Remember to go back to 04_associatable to write ::assoc_options

  def has_one_through(name, through_name, source_name)
    define_method(name) do
      through_options = self.class.assoc_options[through_name]
      source_options = through_options.model_class.assoc_options[source_name]
      sprimary, sforeign, stable = source_options.primary_key, source_options.foreign_key, source_options.table_name
      tprimary, tforeign, ttable = through_options.primary_key, through_options.foreign_key, through_options.table_name
      foreign = self.send(tforeign)
      results = DBConnection.execute(<<-SQL, foreign)
        SELECT
          #{stable}.*
        FROM
          #{ttable}
        JOIN 
        #{stable} 
        ON
           #{ttable}.#{sforeign} = #{stable}.#{sprimary}
        WHERE
          #{ttable}.#{tprimary} = ?
        SQL
        source_options.model_class.parse_all(results).first

    end
  end
end
