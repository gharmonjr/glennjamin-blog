# frozen_string_literal: true

require 'delegate'

class BasePresenter < SimpleDelegator
  def initialize(object, view_context = nil)
    super(object)
    @object = object
    @view_context = view_context
  end

  def self.decorates(name)
    define_method(name) do
      @object
    end
  end

  private

  def _v
    @view_context
  end
end
