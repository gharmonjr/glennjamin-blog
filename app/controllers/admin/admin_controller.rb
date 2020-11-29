# frozen_string_literal: true

module Admin
  class AdminController < ApplicationController
    before_action :authenticate_user!
    before_action :verify_role

    AUTHORIZED_ROLE_LEVEL = [1].freeze

    def verify_role
      redirect_to '/' unless AUTHORIZED_ROLE_LEVEL.include?(current_user.role.level)
    end
  end
end
