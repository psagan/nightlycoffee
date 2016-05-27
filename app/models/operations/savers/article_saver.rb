# class responsible for saving article including object associations
module Operations
  module Savers
    class ArticleSaver < ArticleBase

      def save
        persist(:save)
      end

      def article
        @article ||= Article.new(article_params)
      end
    end
  end
end
