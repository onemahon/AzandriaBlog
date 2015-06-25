module ApplicationHelper
  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div
    end
  end

  def application_name
    'Azandria Blog.'
  end

  def page_title
    'Joe Mahon\'s Blog'
  end

  def markdown(text)
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
    markdown_to_html.render(text).html_safe
  end


end
