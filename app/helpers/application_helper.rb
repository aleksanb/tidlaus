module ApplicationHelper

def active_page_class(page, css_class = 'active')
    return :class => css_class if current_page?(page)
    return {}
end
	
end
