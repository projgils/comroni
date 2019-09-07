class Page < ApplicationRecord
  validates_presence_of :title, :description, :image_url, :content
  validates_uniqueness_of :title
  # validate :self_cannot_be_main_page
  before_validation :self_cannot_be_main_page, on: [ :create, :update ]

  has_many :sub_pages, class_name: 'Page', foreign_key: :main_page_id, dependent: :destroy
  belongs_to :main_page, class_name: 'Page', optional: true

  def page
    Page.find(self.main_page_id) if self.main_page_id.present?
  end

  def display_image_url
    image_url || '/images/sals.png'
  end

  private

    def self_cannot_be_main_page
      p "main_page_id: #{self.main_page_id}"
      p "self_id: #{self.id}"
      if (main_page_id == id) && (main_page_id.present?)
        errors.add(:base, "Can't set self as main page.")
      end
    end
end
