require 'rails_helper'

describe QuestionsHelper do

  describe 'markdown' do
    it 'converts markdown text to html' do
      expect(helper.markdown('# Text')).to eq "<h1>Text</h1>\n"
      expect(helper.markdown('This is **bold** word')).to eq "<p>This is <strong>bold</strong> word</p>\n"
    end
  end

  describe 'strip_markdown' do
    it 'removes markdown formatting' do
      expect(helper.strip_markdown('# Text')).to eq "Text"
      expect(helper.strip_markdown('This is **bold** word')).to eq "This is bold word"
    end
  end

end
