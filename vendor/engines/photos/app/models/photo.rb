class Photo < ActiveRecord::Base

  acts_as_taggable
  
  acts_as_indexed :fields => [:caption]
  
  belongs_to :picture, :class_name => 'Image'
end
