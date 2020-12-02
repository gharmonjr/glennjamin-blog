# frozen_string_literal: true

class BlogPostsController < ApplicationController
  before_action :set_post, only: %i[show]
  def index
    @posts = Post.published.order(publish_date: :desc)
  end

  def show; end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
