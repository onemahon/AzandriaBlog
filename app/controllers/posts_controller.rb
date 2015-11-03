class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  before_action :find_jumbotron, only: [:index]
  before_action :find_page_title, only: [:show]

  helper_method :post

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  def post
    Post.find(params[:id])
  end

  private

  def find_jumbotron
    @jumbotron = Jumbotron.random_for_current_time ||
      Jumbotron.where(time_period_type: Jumbotron::TIME_PERIOD_TYPES::DEFAULT).last
  end

  def find_page_title
    @page_title = @post.title
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(Post.params)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

end
