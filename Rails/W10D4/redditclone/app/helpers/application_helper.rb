module ApplicationHelper
    def form_authenticity_token_helper
        "<input name=\"authenticity_token\" type=\"hidden\" value=\"<%= #{ form_authenticity_token} %>\">".html_safe
    end
end
