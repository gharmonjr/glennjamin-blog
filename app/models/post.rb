# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_rich_text :content

  scope :published, -> { where(published: true).order(publish_date: :desc) }

  def to_param
    title.parameterize
  end
end
