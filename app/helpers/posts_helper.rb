module PostsHelper
  def first_three_posts
    @posts.order(created_at: :desc).first(3)
  end

  def next_hundred_posts_after_three
    @posts.limit(100).order(created_at: :desc).offset(3)
  end

  def markdown(markdown_text)
    find_and_preserve MarkdownParser.markdown(markdown_text)
  end

  def tags_links(post)
    post.tags.map{|tag| "#{link_to tag.name, tag}" }.join(", ").html_safe
  end
end
