# class responsible for saving article including object associations
class ArticleSaver

  def initialize(params)
    @params = params
  end

  def save
    operation_result = persist_article
    assign_tags if operation_result
    operation_result
  end

  def article
    @article ||= get_article_using_params
  end

  private

  def persist_article
    article.persisted? ? article.update(article_params) : article.save
  end

  def get_article_using_params
    article_params[:id] ? Article.find(article_params[:id]) : Article.new(article_params)
  end

  def assign_tags
    article.tags.delete_all
    tag_params.each do |tag_data|
      assign_tag(tag_data)
    end
  end

  def assign_tag(tag_data)
    article.tags << get_tag_object(tag_data)
  end

  def get_tag_object(tag_data)
    if tag_data[:id]
      Tag.find(tag_data[:id])
    else
      Tag.find_or_create_by(name: tag_data[:text])
    end
  end

  def article_params
    params[:article]
  end

  def tag_params
    params[:tags] ? params[:tags] : []
  end

  attr_reader :params
end