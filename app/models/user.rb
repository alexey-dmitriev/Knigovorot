class User < ActiveRecord::Base
attr_accessible :name, :email, :password, :password_confirmation, :avatar

has_attached_file :avatar, 
                    :styles => { :medium => "300x300>",
                                 :thumb => "100x100>" },
                    :url  => "/assets/users/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"

validates_attachment_presence :avatar
validates_attachment_size :avatar, :less_than => 5.megabytes
validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']
                    

has_secure_password
validates_presence_of :password, :on => :create

email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

validates :name, :presence => true,
                 :length   => {:maximum => 50}

validates :email, :presence   => true,
                  :format     => {:with => email_regex},
                  :uniqueness => { :case_sensitive => false }
end
