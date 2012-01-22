class Author < ActiveRecord::Base
attr_accessible :name, :info, :author_img

has_and_belongs_to_many :books
has_and_belongs_to_many :publications

has_attached_file :author_img, 
                  :styles => {  :medium => "300x300>",
                                :thumb  => "100x100>" },
                  :url  => "/assets/authors/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/authors/:id/:style/:basename.:extension"

validates_attachment_size :author_img, :less_than => 5.megabytes
validates_attachment_content_type :author_img, :content_type => ['image/jpeg', 'image/png']

end
