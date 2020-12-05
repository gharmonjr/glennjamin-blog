# frozen_string_literal: true

class BlogController < ApplicationController
  before_action :set_post, only: %i[show]
  def index
    @posts = Post.published.group_by{ |post| Date.new(post.publish_date.year, post.publish_date.month) }
  end

  def show; end

  private

  def set_post
    @post = Post.find_by(slug: params[:slug])
  end
end
