class Page < ApplicationRecord
  validates_presence_of :title, :description, :content
  validates_uniqueness_of :title
  # validate :self_cannot_be_main_page
  before_validation :self_cannot_be_main_page, on: [ :create, :update ]

  has_many :sub_pages, class_name: 'Page', foreign_key: :main_page_id, dependent: :destroy
  belongs_to :main_page, class_name: 'Page', optional: true
  belongs_to :category, optional: true

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  def page
    Page.find(self.main_page_id) if self.main_page_id.present?
  end

  def display_image_url
    i ='/images/sals.png'
    i = image_url if not image_url.blank?
    i
  end

  def address
    address_details || 'Ormoc City, Leyte, PH'
  end

  def page_category
    c = 'Others'
    c = category.name if category_id.present?
    c
  end

  private

    def self_cannot_be_main_page
      if (main_page_id == id) && (main_page_id.present?)
        errors.add(:base, "Can't set self as main page.")
      end
    end
end
