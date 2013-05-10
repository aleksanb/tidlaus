module ApplicationHelper

	def active_page_class(page, css_class = 'active')
	    return :class => css_class if current_page?(page)
	    return {}
	end

	def active_controller_class(con, css_class= 'active')
		return :class => css_class if params[:controller] == con
		return {}
	end

	def javascript(*args)
		content_for(:tail) { javascript_include_tag(*args) }
	end

	def markdown(content, safe)
	  	markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
      if safe
        markdown.render(content).html_safe
      else
        sanitize(markdown.render(sanitize(content)))
      end
	end

end
