require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

#.send example
#c = Car.new
#c.make="Honda"
#c.model="CRV"
#c.year="2014"
# = 
#c = Car.new()
#params.each do |key, value|
#  c.send("#{key}=", value)
#end
#<%= link_to 
#    send("first_part_of_path_{some_dynamic_parameters}_end_path", 
#    attr1, attr2), ....
#    %>
class SQLObject
  def self.columns

    return @columns if @columns
    cols = DBConnection.execute2(<<-SQL).first
      SELECT
        *
      FROM
        #{self.table_name}    
    SQL
    cols.map!(&:to_sym)
    @columns = cols
  end

  def self.finalize!
    self.columns.each do |col|
      define_method(col) do
        self.attributes[col]
      end
      define_method("#{col}=") do |val|
        self.attributes[col] = val
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    if @table_name
      @table_name 
    else
      self.name.underscore.pluralize
    end
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name} 
    SQL
    parse_all(results)
  end

  def self.parse_all(results)
    results.map {|result| self.new(result)}
  end

  def self.find(id)
    results = DBConnection.execute(<<-SQL, id)
    SELECT
      *
    FROM
      #{table_name}
    WHERE
      id = ?
    SQL
    parse_all(results).first
  end

  def initialize(params = {})
    params.each do |attr_name, val|
      attr_name = attr_name.to_sym
      if self.class.columns.include?(attr_name)
        self.send("#{attr_name}=", val)
      else 
        raise "unknown attribute '#{attr_name}'"
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map {|inst| self.send(inst)}
  end

  def insert
    columns = self.class.columns[1..-1]
    col_names = columns.map(&:to_s).join(", ")
    question_marks = (['?'] * columns.count).join(", ")
    DBConnection.execute(<<-SQL, *attribute_values[1..-1])
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES  
        (#{question_marks})
      SQL
      self.id = DBConnection.last_insert_row_id
  end

  def update
    set_line = self.class.columns.map{|attribute|  "#{attribute} = ?"}.join(", ")
    DBConnection.execute(<<-SQL, *attribute_values, id)
      UPDATE
        #{self.class.table_name}
      SET
        #{set_line}
      WHERE
        id = ?
      SQL
  end

  def save
    if id == nil
      insert
    else
      update
    end
  end
end
