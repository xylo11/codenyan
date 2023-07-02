module ApplicationHelper
  def markdown(text)
    render_options = {
      filter_html: true,
      hard_wrap: true,
      link_attributes: { rel: 'nofollow' }
    }
    renderer = Redcarpet::Render::HTML.new(render_options)

    extensions = {
      autolink: true,
      fenced_code_blocks: true
    }

    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end
end
