require 'rails_helper'

feature 'Visitor on homepage' do
  scenario 'sees articles header' do
    visit root_path

    expect(page).to have_css('h1'), text: 'Articles'
  end

  scenario 'sees list of latest articles' do
    article = double(:article, title: 'First article', content: 'Testing description')
    article2 = double(:article, title: 'Second article', content: 'Testing description')
    allow(Article).to receive(:all).and_return([article, article2])

    visit root_path

    expect(page).to have_content(article.title)
    expect(page).to have_content(article2.title)
  end
end