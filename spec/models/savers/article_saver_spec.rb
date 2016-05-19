require 'rails_helper'

RSpec.describe ArticleSaver do
  describe "#save" do
    it "creates new article when no id provided" do
      count_before = Article.count
      params = {
          article: {title: 'test title', content: 'test content'},
          tags: []
      }
      article_saver = ArticleSaver.new(params)

      article_saver.save

      expect(Article.count).to eq(count_before + 1)
    end

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
      article_saver = ArticleSaver.new(params)

      article_saver.save

      expect(Article.count).to eq(count_before)
    end



  end
end