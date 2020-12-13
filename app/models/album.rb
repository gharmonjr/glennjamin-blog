# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  name       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_albums_on_slug  (slug) UNIQUE
#
class Album < ApplicationRecord
  has_many :photos
end
