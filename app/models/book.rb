class Book < ActiveRecord::Base
attr_accessible :name, :info, :book_cover

has_and_belongs_to_many :authors
has_and_belongs_to_many :publications

has_attached_file :book_cover, 
                  :styles => {  :medium => "300x300>",
                                :thumb  => "100x100>" },
                  :url  => "/assets/books/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/books/:id/:style/:basename.:extension"

validates_attachment_size :book_cover, :less_than => 5.megabytes
validates_attachment_content_type :book_cover, :content_type => ['image/jpeg', 'image/png']
end
