class MarkdownParser
  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      language ||= 'debug'
      CodeRay.scan(code, language).div
    end
  end

  def self.markdown(text)
    # From https://www.codefellows.org/blog/how-to-create-a-markdown-friendly-blog-in-a-rails-app
    coderayified = CodeRayify.new(filter_html: false, hard_wrap: false)
    options = {
        fenced_code_blocks: true,
        no_intra_emphasis: true,
        autolink: true,
        strikethrough: true,
        lax_html_blocks: true,
        superscript: true
    }
    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    if text
      markdown_to_html.render(text).html_safe if text
    else
      nil
    end
  end
end
