class Photo < ActiveRecord::Base

  acts_as_indexed :fields => [:caption]

  validates :caption, :presence => true, :uniqueness => true
  
  belongs_to :picture, :class_name => 'Image'
end
