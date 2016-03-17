module QuestionsHelper

  def markdown(text)
    unless @markdown
      renderer = Redcarpet::Render::HTML.new(filter_html: true)
      @markdown = Redcarpet::Markdown.new(renderer)
    end
    @markdown.render(text).html_safe
  end

  def strip_markdown(text)
    strip_tags(markdown(text)).strip
  end

end
