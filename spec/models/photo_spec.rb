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
require 'rails_helper'

RSpec.describe Photo, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
