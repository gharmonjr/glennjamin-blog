# frozen_string_literal: true

module Admin
  class PostsController < AdminController
    before_action :set_post, only: %i[edit update show]
    def index; end

    def new
      @post = Post.new
    end

    def edit; end

    def show
      date = Date.parse(@post.publish_date.to_s)
      @post_date = date.strftime('%B %d, %Y')
    end

    def update
      if @post.update(parsed_params)
        redirect_to admin_path, notice: 'Post successfully updated'
      else
        render :edit
      end
    end

    def create
      @post = Post.new(parsed_params)
      if @post.save
        redirect_to admin_path, notice: 'Post successfully saved'
      else
        render :new
      end
    end

    private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :description, :content, :publish_date)
    end

    def parsed_params
      @parsed_params = {
        user_id:      current_user.id,
        title:        post_params[:title],
        description:  post_params[:description],
        content:      post_params[:content],
        published:    true,
        publish_date: post_params[:publish_date]
      }
    end
  end
end