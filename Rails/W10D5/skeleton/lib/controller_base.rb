require 'active_support'
require 'active_support/core_ext'
require 'erb'
require 'active_support/inflector'
require_relative './session'
require_relative './flash'
require 'uri'
require 'webrick'
require 'byebug'
class ControllerBase
   
  attr_reader :req, :res, :params

 
  def initialize(req, res, route_params = {})
    @req, @res = req, res
    @params = route_params.merge(req.params)
    @already_built_response = false
  end


  def already_built_response?
    @already_built_response
  end

  def redirect_to(url)
    raise "double render error" if already_built_response?
    @res.status = 302
    @res["Location"] = url
    @already_built_response = true
    session.store_session(@res)
  end


  def render_content(content, content_type)
    raise "double render error" if already_built_response?
    
    @res.write(content)
    @res['Content-Type'] = content_type
    @already_built_response = true
    session.store_session(@res)
    
    nil 
  end

  def render(template_name)
    path = File.dirname(__FILE__)
    template = File.join(path, "..", "views", self.class.name.underscore, "#{template_name}.html.erb")
    code = File.read(template)
    render_content(ERB.new(code).result(binding), "text/html")
  end

 
  def session
    @session ||= Session.new(@req) 
  end


  def invoke_action(name)
    self.send(name)
    render(name) unless already_built_response?

    nil
  end
end

