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

end
