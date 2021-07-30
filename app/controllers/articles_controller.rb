class ArticlesController < ApplicationController

    def home
    end

    def about
    end

    def show
        @article = Article.find(params[:id])
    end

end