# frozen_string_literal: true

class ContentController < ApplicationController
  def post
    @post = Post.find_by!(slug: params[:slug])
  end

  def about
    @page = Page.find_by!(slug: 'about')
  end

  def photos
    @photos = Photo.with_attached_photograph
  end

  def photo
    @photo = Photo.find_by(slug: params[:slug])
  end
end
