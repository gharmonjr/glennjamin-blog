# frozen_string_literal: true

class ContentController < ApplicationController
  def post
    @post = Post.find_by!(slug: params[:slug])
  end

  def page
    @page = Page.find_by!(slug: params[:slug])
  end
end
