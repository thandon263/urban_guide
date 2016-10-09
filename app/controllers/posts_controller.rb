class PostsController < ApplicationController
  before_action :find_posts, only: [:show, :edit, :destroy, :update]

  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params

    if @post.save
      redirect_to @post, notice: "Hey man, Great...Post saved successfully!!"
    else
      render :new, notice: "Oh no, post was not saved."
    end
  end

  def show

  end

  def edit
  end

  def update
    if @post.update post_params
      redirect_to @post, notice: "Huzzah! Your article was successfully updated."
    else
      render :edit, notice: "Boom!!, You not Lucky today! article not updated"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private


  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_posts
    @post = Post.find(params[:id])
  end
end
