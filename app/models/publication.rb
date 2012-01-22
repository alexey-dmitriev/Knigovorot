class Publication < ActiveRecord::Base
attr_accessible :name, :info, :copies, :format, :publisher_id, :date_of_pub
  belongs_to :publisher
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :books
end
