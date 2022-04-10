class ArticlesController < ApplicationController
    
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def home
    end

    def about
    end

    def show
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
    end

    def create
        @article = Article.new(article_params)
        @article.user = User.first
        if @article.save
            flash[:notice] = "Article was created successfully!"
            redirect_to article_path(@article) #this will get /article/:id path
            #the above line is the same as 'redirect_to @article'
        else
            render 'new'
        end   
    end

    def update
        if @article.update(article_params)
            flash[:notice] = "Article was updated successfully!"
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article.destroy
        redirect_to articles_path
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end
end