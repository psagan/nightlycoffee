require 'rails_helper'

feature 'Visitor on homepage' do
  scenario 'sees articles header' do
    visit root_path

    expect(page).to have_css('h1'), text: 'Articles'
  end

  scenario 'sees list of latest articles' do
    article = Article.create!(
       title: 'First article',
       content: 'Testing description'
    )

    visit root_path
    expect(page).to have_content(article.title)
  end
end