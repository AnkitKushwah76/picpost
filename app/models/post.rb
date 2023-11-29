require "image_processing/vips"

class Post < ApplicationRecord
  include Navigable

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image
  validates :image, presence: true
  validate :image_format
  before_save :convert_to_jpg
  

  ACCEPTABLE_FORMATS = %w[image/png image/jpeg image/bmp].freeze

  scope :by_user, -> (user_id) {
    where(user_id: user_id)
  }

  scope :except_current_user, -> (user_id) {
    where.not(user_id: user_id)
  }

  private

  def image_format
    if image.attached? && !ACCEPTABLE_FORMATS.include?(image.blob.content_type)
      errors.add(:image, 'must be a PNG, JPG, or BMP')
    end
  end

  def convert_to_jpg
    return unless image.attached?

    processed = ImageProcessing::Vips.source(image).convert('jpg')

    image.blob.update(filename: "#{image.blob.filename.base}.jpg", 
                      content_type: 'image/jpg')
  end
end
