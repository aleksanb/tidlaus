class PagesController < ApplicationController
    filter_access_to :all
    
	def index
	    @title = "Index"
        images = Image.limit(5)
        #links = Link.limit(5)
        articles = Article.limit(5)

        @objects = images+articles
        @objects.sort! {|a,b| b.created_at <=> a.created_at}
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
