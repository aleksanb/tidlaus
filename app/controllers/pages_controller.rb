class PagesController < ApplicationController
    
	def index
	    @title = "Index"
	end

    def about
        @title = "About"
    end

    def magi
        @title = "Magi"
    end

    def chat
    	@title = "Chat"
    end

    def kaizervirus
        @title = "Kaizervirus"
    end

end
