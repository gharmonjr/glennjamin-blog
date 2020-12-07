# frozen_string_literal: true

module Admin
  class PagesController < AdminController
    before_action :set_page, only: %i[edit update show]

    def index; end

    def new
      @page = Page.new
    end

    def edit; end

    def show; end

    def update
      if @page.update(parsed_params)
        redirect_to admin_path, notice: 'Page successfully updated'
      else
        render :edit
      end
    end

    def create
      @page = Page.new(parsed_params)
      if @page.save
        redirect_to admin_path, notice: 'Page successfully saved'
      else
        render :new
      end
    end

    private

    def set_page
      @page = Page.find_by_slug(params[:id])
    end

    def page_params
      params.require(:page).permit(:title, :content)
    end

    def publish_page?
      params[:save_as_draft].present? ? false : true
    end

    def parsed_params
      @parsed_params = {
        title:     page_params[:title],
        content:   page_params[:content],
        published: publish_page?,
        slug:      page_params[:title].parameterize
      }
    end
  end
end
