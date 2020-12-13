# frozen_string_literal: true

module Admin
  class DashboardController < AdminController
    def index
      @posts = Post.all
      @pages = Page.all
      @albums = Album.all
      @photos = Photo.all
    end
  end
end
