class TagsController < ApplicationController
  before_action :find_tag, only: [:show]

  before_action :find_page_title, only: [:show]
  before_action :find_posts, only: [:show]

  def show
  end

  private

  def find_posts
    @posts = Post.for_tag(@tag).recent
  end

  def find_tag
    @tag = Tag.find(params[:id])
  end

  def find_page_title
    @page_title = @tag.name
  end
end
