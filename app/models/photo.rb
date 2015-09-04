class Photo < ActiveRecord::Base
  belongs_to :album
  mount_uploader :image, Uploader
end
