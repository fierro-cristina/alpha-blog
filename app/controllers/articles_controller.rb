class ArticlesController < ApplicationController

    def home
    end

    def about
    end

    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
    end

    def create
    end

end