class CommentsController < ApplicationController
    before_action :require_user_logged_in!
    def create
      @article = Article.find(params[:article_id])

      @comment = @article.comments.new(body: params[:comment][:body], user_id: Current.user.id)

      if @comment.save
        redirect_to article_path(@article), notice: "comment successfully added!"
      else
        redirect_to article_path(@article), alert: "comment not added, write something to add comment!"
      end
    end
  
    private
      def comment_params
        params.require(:comment).permit(:commenter, :body)
      end
end
  