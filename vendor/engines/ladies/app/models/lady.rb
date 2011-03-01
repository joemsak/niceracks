class Lady < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :bio]

  validates :name, :presence => true, :uniqueness => true
  
  has_friendly_id :name, :use_slug => true, :approximate_ascii => true, :strip_non_ascii => true
  
  belongs_to :photo, :class_name => 'Image'
end
