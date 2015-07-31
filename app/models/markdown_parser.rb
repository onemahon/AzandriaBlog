class MarkdownParser
  def self.markdown(text)
    # From https://www.codefellows.org/blog/how-to-create-a-markdown-friendly-blog-in-a-rails-app
    coderayified = CodeRayify.new(:filter_html => true,
                                  :hard_wrap => true)
    options = {
        :fenced_code_blocks => true,
        :no_intra_emphasis => true,
        :autolink => true,
        :lax_html_blocks => true,
    }
    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text)
  end

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div
    end
  end
end
