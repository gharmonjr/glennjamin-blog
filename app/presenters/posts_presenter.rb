# frozen_string_literal: true

class PostsPresenter
  decorates :posts

  def month_and_year
    [post.publish_date.month, post.publish_date.year].join
  end
end
