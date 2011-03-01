class Performance < ActiveRecord::Base

  acts_as_indexed :fields => [:venue_name, :cost, :description, :link]

  validates :venue_name, :presence => true, :uniqueness => true
  
end
