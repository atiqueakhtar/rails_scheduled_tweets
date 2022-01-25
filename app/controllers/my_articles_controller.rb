class MyArticlesController < ApplicationController
    def index
        @articles = Article.where("email = ? AND (status = ? OR status = ?)", Current.user.email, "public", "private")
    end
end