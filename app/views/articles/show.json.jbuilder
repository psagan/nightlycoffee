json.extract! @article, :id, :title, :content, :created_at, :updated_at
json.tags @article.tags do |tag|
  json.extract! tag, :id, :name
  json.text tag.name
end
