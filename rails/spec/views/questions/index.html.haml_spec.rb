require 'rails_helper'

RSpec.describe "questions/index", :type => :view do
  before do
    assign(:questions, [create(:markdown_question)])
    render
  end

  it 'displays markdown question as plain text' do
    expect(rendered).to match /Markdown question/
  end

  it 'does not display the question as markdown' do
    expect(rendered).not_to match /# Markdown question/
  end

  it 'does not display the question as html' do
    expect(rendered).not_to match /<h1>Markdown question<\/h1>/
  end

  it 'displays only the first line of the question' do
    expect(rendered).not_to match /This is the second line/
  end
end
