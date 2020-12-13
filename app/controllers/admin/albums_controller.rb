# frozen_string_literal: true

module Admin
  class AlbumsController < AdminController
    before_action :set_album, only: %i[edit update]
    def index; end

    def new
      @album = Album.new
    end

    def edit
      @album = Album.find(params[:id])
    end

    def update
      if @album.update(album_params)
        redirect_to admin_path, notice: 'Album successfully update'
      else
        render :edit
      end
    end

    def create
      @album = Album.new(album_params)
      if @album.save
        redirect_to admin_path, notice: 'Album Saved'
      else
        render :new
      end
    end

    private

    def set_album
      @album = Album.find(params[:id])
    end

    def album_params
      safe_params = params.require(:album).permit(:name, :slug)
      safe_params[:slug] = safe_params[:name].parameterize
      safe_params
    end
  end
end
