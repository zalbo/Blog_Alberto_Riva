class Image < ActiveRecord::Base
  belongs_to :work

  has_attached_file :image , styles: { medium: "1000x680", thumb: "350x350#" }, default_url: "/images/:style/missing.png"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
