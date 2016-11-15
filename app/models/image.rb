class Image < ActiveRecord::Base
  belongs_to :work

  has_attached_file :image,
  :path => ":rails_root/public/images/:id/:filename",
  :url  => "/images/:id/:filename",
  :styles => {
      :thumb => "100x100#",
      :small  => "150x150>",
      :medium => "200x200" }

do_not_validate_attachment_file_type :image
end
