# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_rich_text :content

  scope :published, -> { where(published: true) }
end
