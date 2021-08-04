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
        @article = Article.new(params.require(:article).permit(:title, :description))
        @article.save
        redirect_to article_path(@article) #this will get /article/:id path
        #the above line is the same as 'redirect_to @article'
        
    end

end