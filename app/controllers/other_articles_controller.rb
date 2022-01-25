class OtherArticlesController < ApplicationController
    def index
        @articles = Article.where("email != ? AND status = ?", Current.user.email, "public")
    end
end