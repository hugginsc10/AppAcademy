require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    @class_name = Object.const_get(class_name) #calls module const_get to create Constant
    
  end

  def table_name
    model_class.table_name #ln 31 in 01_sql_object.rb table_name=
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    conv = {:class_name => name.to_s.capitalize.singularize.camelcase, 
      :primary_key => :id, :foreign_key => "#{name}_id".downcase.to_sym}
    conv.each do |k,v|
      self.send("#{k}=", options[k] || conv[k] ) #setting k to default or given options
    end
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})  #conv = default values
    conv = {:class_name => name.to_s.capitalize.singularize.camelcase, 
      :primary_key => :id, :foreign_key => "#{self_class_name.downcase.underscore}_id".to_sym }  # user = :user_id
    conv.each do |k,v|   #setting k to default or given options
      if options[k].nil?
        self.send("#{k}=",v)
      else
        self.send("#{k}=",options[k])
      end 
    end
  end
end

#has_many :course,
#primary_key: :id,
#foreign_key: :course_id,
#class_name: :User

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    options = BelongsToOptions.new(name, options)
    define_method(name) do
     self.send(options.foreign_key).nil? ? (return nil) : options.model_class.where(options.primary_key => send(options.foreign_key)).first
    end
    
  end

  def has_many(name, options = {})
    options = HasManyOptions.new(name, self.to_s, options)
    define_method(name) do
      self.id.nil? ? (return []) : options.model_class.where(options.foreign_key => self.id)
    end
    
  end

  def assoc_options
    
  end
end

class SQLObject
  extend Associatable
end
