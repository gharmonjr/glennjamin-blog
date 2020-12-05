# frozen_string_literal: true

module Admin
  class DashboardController < AdminController
    def index
      @posts = Post.all
    end
  end
end
