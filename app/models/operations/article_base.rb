module Operations
  class ArticleBase
    def initialize(params)
      @params = params
    end

    private

    def persist(method, *args)
      operation_result = article.send(method, *args)
      assign_tags if operation_result
      operation_result
    end

    def assign_tags
      article.tags.delete_all
      tag_params.each do |tag_data|
        assign_tag(tag_data)
      end
    end

    def assign_tag(tag_data)
      tag = get_tag_object(tag_data)
      article.tags << tag if tag.valid?
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
end