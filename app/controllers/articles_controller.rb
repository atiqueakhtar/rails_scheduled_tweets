class ArticlesController < ApplicationController
    def index
      @articles = Article.where("status = ?", "public")
    end
    # def index
    #     if session[:user_id]
    #         @user = User.find_by(id: session[:user_id]) 
    #     end
    # end
    def show
      @article = Article.find(params[:id])
    end

    def new
      require_user_logged_in! unless session[:user_id]
      @article = Article.new
    end

    def create
      @article = Article.new(title: params[:article][:title], body: params[:article][:body], status: params[:article][:status], email: Current.user.email, user_id: Current.user.id)
  
      if @article.save
        redirect_to root_path, notice: "Article created successfully!"
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
      @article = Article.find(params[:id])
    end
  
    def update
      @article = Article.find(params[:id])
  
      if @article.update(article_params)
        redirect_to @article, notice: "Status updated successfully!"
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @article = Article.find(params[:id])
      @article.comments.destroy_all
      @article.destroy
  
      redirect_to root_path, notice: "Article deleted successfully!"
    end

    def my_articles
        # @articles = Article.where("email = ? AND (status = ? OR status = ?)", Current.user.email, "public", "private")
        @articles = Current.user.articles.public_private_articles
    end

    def other_articles
        # @articles = Article.where("email != ? AND status = ?", Current.user.email, "public")
        @articles = Article.not_public_users
    end

    def archived_articles
        # @articles = Article.where("email = ? AND status = ?", Current.user.email, "archived")
        @articles = Current.user.articles.archived
    end
  
    private
      def article_params
        params.require(:article).permit(:title, :body, :status)
      end
end
  