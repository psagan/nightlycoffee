require 'rails_helper'

feature 'Visitor on homepage' do
  scenario 'sees articles header' do

    visit root_path

    expect(page).to have_css('h1'), text: 'Articles'

  end
end