module PostsHelper

  def content_truncated(content, should_truncate: false)
    if should_truncate
      truncate(content, length: 500)
    else
      content
    end
  end
end
