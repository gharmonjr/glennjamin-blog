# frozen_string_literal: true

module Admin
  class PhotosController < AdminController
    before_action :set_photo, only: %i[edit update show]

    def new
      @photo = Photo.new
    end

    def edit; end

    def update
      if @photo.update(photo_params)
        redirect_to admin_path, notice: 'Photo uploaded successfully'
      else
        render :edit
      end
    end

    def show; end

    def create
      @photo = Photo.new(photo_params)
      binding.pry
      if @photo.save
        redirect_to admin_path, notice: 'Photo uploaded successfully'
      else
        render :new
      end
    end

    private

    def set_photo
      @photo = Photo.find(params[:id])
    end

    def photo_params
      params.require(:photo).permit(:name, :desc, :photograph, :album_id, :settings)
    end
  end
end
