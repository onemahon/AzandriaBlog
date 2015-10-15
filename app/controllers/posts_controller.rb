class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  before_action :find_jumbotron, only: [:index]

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
    @jumbotron = Jumbotron.last
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
