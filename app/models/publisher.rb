class Publisher < ActiveRecord::Base
attr_accessible :name, :info

has_many :publications 
end
