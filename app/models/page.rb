class Page < ApplicationRecord
  validates_presence_of :title, :description, :image_url, :content
  validates_uniqueness_of :title
end
