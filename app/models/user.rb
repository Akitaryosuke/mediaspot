class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avater_image
  has_many :posts, dependent: :destroy

  mount_uploader :avater_image, ImageUploader

  attr_acceessor :avater_image_x
  attr_acceessor :avater_image_y
  attr_acceessor :avater_image_w
  attr_acceessor :avater_image_h

  version :resized do
    process :crop
    process resize_to_fill: [600, 600]
  end

  private
  def crop
    return if [model.avater_image_x, model.avater_image_y, model.avater_image_w, model.avater_image_h].all?
    manipulate! do |img|
      crop_x = model.avate_image_x.to_i
      crop_y = model.avate_image_y.to_i
      crop_w = model.avate_image_w.to_i
      crop_h = model.avate_image_h.to_i
      img.crop "#{crop_w}x#{crop_h}+#{crop_x}+#{crop_y}"
      img = yield(img) if block_given?
      img
    end
  end

end
