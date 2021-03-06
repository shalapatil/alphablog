class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.paginate(page: params[:page], per_page: 3)
    end

    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end

    def create
      @article = Article.new(params.require(:article).permit(:title, :description))
      @article.user = current_user
      if @article.save
        flash[:notice] = "Article created successfully!"
        redirect_to article_path(@article)
      else
        render 'new'
      end
    end

    def update
        @article = Article.find(params[:id])
        @article.user = current_user
        if @article.update(params.require(:article).permit(:title, :description))
            flash[:notice] = "Article edited successfully!"
            redirect_to article_path(@article)
          else
            render 'edit'
          end 
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end



end
