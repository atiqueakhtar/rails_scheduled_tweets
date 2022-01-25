class ArchivedArticlesController < ApplicationController
    def index
        @articles = Article.where("email = ? AND status = ?", Current.user.email, "archived")
    end
end