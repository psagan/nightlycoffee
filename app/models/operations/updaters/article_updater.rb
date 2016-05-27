module Operations
  module Updaters
    class ArticleUpdater < ArticleBase

      # Public: update
      #
      # Returns boolean
      def update
        persist(:update, article_params)
      end

      def article
        @article ||= Article.find(article_params[:id])
      end

    end
  end
end