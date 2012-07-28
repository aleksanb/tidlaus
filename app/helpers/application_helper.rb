module ApplicationHelper

	def active_page_class(page, css_class = 'active')
	    return :class => css_class if current_page?(page)
	    return {}
	end

	def active_controller_class(con, css_class = 'active')
		return :class => css_class if params[:controller] == con
		return {}
	end


	def fetch_recent_links(howmany)
		@recent_links = Link.last(howmany)
	end
	
end