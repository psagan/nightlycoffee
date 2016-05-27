require 'rails_helper'

RSpec.describe Operations::Savers::ArticleSaver do
  describe "#save" do
    it "creates new article when no id provided" do
      count_before = Article.count
      params = {
          article: {title: 'test title', content: 'test content'},
          tags: []
      }
      article_saver = Operations::Savers::ArticleSaver.new(params)

      article_saver.save

      expect(Article.count).to eq(count_before + 1)
    end
  end
end