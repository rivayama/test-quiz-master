require 'rails_helper'

RSpec.describe "questions/show", :type => :view do
  before do
    assign(:question, create(:markdown_question))
    render
  end

  it 'displays markdown question as html' do
    expect(rendered).to match /<h1>Markdown question<\/h1>/
    expect(rendered).to match /<p>This is the second line<\/p>/
  end
end
