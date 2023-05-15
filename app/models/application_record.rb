class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def get_avater_image(resize: "120x120", gravity: "center", crop: "120x120+0+0")
    unless avater_image.attached?
      file_path = Rails .root.join('app/assets/images/no_image.jpg')
      avater_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    avater_image.variant(resize: "120x120", gravity: "center", crop: "120x120+0+0").processed
  end

end
