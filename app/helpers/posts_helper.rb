module PostsHelper
  def first_three_posts
    @posts.order(created_at: :desc).first(3)
  end

  def next_hundred_posts_after_three
    @posts.limit(100).order(created_at: :desc).offset(3)
  end

  def markdown(markdown_text)
    MarkdownParser.markdown(markdown_text)
  end
end
