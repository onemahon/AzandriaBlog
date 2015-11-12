class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  before_action :set_jumbotron, only: [:index]
  before_action :set_page_title, only: [:show]

  def index
    @posts = Post.published
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(Post.params)
  end

  def set_jumbotron
    @jumbotron = Jumbotron.random_for_current_time ||
      Jumbotron.where(time_period_type: Jumbotron::TIME_PERIOD_TYPES::DEFAULT).last
  end

  def set_page_title
    @page_title = @post.title
  end

  def set_post
    @post = Post.published.find(params[:id])
  end
end
