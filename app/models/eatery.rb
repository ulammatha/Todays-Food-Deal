class Eatery < ActiveRecord::Base
   has_many :deals
   has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
