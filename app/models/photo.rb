# == Schema Information
#
# Table name: photos
#
#  id         :bigint           not null, primary key
#  desc       :string
#  name       :string
#  settings   :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  album_id   :bigint           not null
#
# Indexes
#
#  index_photos_on_album_id  (album_id)
#  index_photos_on_slug      (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (album_id => albums.id)
#
class Photo < ApplicationRecord
  belongs_to :album
  has_one_attached :photograph

  before_create :generate_slug
  def generate_slug
    string_length = 8
    slug = rand(36**string_length).to_s(36)
    if collision?(slug)
      generate_slug
    else
      self.slug = slug
    end
  end

  def collision?(slug)
    Photo.exists?(slug: slug)
  end
end
