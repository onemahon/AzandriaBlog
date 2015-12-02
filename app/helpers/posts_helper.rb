module PostsHelper
  def first_three_posts
    @posts.recent.first(3)
  end

  def next_hundred_posts_after_three
    @posts.recent.limit(100).offset(3)
  end

  def markdown(markdown_text)
    find_and_preserve MarkdownParser.markdown(markdown_text)
  end

  def tags_links(post)
    post.tags.map{|tag| "#{link_to tag.name, tag}" }.join(", ").html_safe
  end
end
