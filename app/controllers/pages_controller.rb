# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :set_page
  def show; end

  private

  def set_page
    @page = Page.find_by!(slug: params[:slug])
  end
end
