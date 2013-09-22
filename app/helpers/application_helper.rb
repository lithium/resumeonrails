module ApplicationHelper

  def markdown(text, *options)
    md = Redcarpet::Markdown.new(Redcarpet::Render::HTML, *options)
    md.render(text)
  end
end
