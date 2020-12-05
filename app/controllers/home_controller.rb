# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    # @posts = Post.published.order(publish_date: :desc).group_by{ |post| Date.new(post.publish_date.year, post.publish_date.month) }
    @posts = Post.published
  end
end
