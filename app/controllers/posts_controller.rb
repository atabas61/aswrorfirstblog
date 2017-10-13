class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.where(status:true).order('id DESC').all
  end
    
  def category
      @category = Category.find_by_slug(params[:slug])
      @posts = Post.where(status:true, category_id:@category.id).order('id DESC').all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

    

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :keywords, :desc, :content, :image)
    end
end
