module LinksHelper

	def urlhelper(link)
		"http://#{link.shorturl}"
	end

	def urlhelper2(link)
		"http://tidla.us/#{link.longurl}"
	end

end
