class Photo < ActiveRecord::Base

  acts_as_taggable
  
  acts_as_indexed :fields => [:caption]
  
  belongs_to :picture, :class_name => 'Image'
  
  validates :photo_id, :presence => true
  
  def title
    caption.blank? ? picture.file_name : caption
  end
  
end
