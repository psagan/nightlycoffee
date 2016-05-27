require 'rails_helper'

RSpec.describe Operations::Updaters::ArticleUpdater do
  describe "#update" do

    it "updates existing article when id provided" do
      article = FactoryGirl.create(:article)
      count_before = Article.count
      params = {
          article: {
              id: article.id,
              title: 'test title',
              content: 'test content'
          },
          tags: []
      }
      article_saver = Operations::Updaters::ArticleUpdater.new(params)

      article_saver.update

      expect(Article.count).to eq(count_before)
    end

  end
end