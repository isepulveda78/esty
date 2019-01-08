class Listing < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :orders
  validates :name, :description, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validate :correct_iamge_type

  private
  def correct_iamge_type
    if image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
      errors.add(:image, 'Must be a JPEG or PNG')
    elsif image.attached? == false
      errors.add(:image, 'required.')
  end
end
end
