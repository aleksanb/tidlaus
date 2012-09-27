class PagesController < ApplicationController
    
	def index
	    @title = "Index"
        @images = Image.limit(5)
        @links = Link.limit(5)
        @objects = @links+@images
        @objects.sort! {|a,b| b.created_at <=> a.created_at}
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
