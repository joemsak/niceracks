class Performance < ActiveRecord::Base

  acts_as_indexed :fields => [:venue_name, :cost, :description, :link]

  validates :venue_name, :presence => true, :uniqueness => true
  
  has_friendly_id :date_and_name, :use_slug => true
  
  private
  
  def date_and_name
    "#{starts_at.strftime '%m-%d-%Y'}-#{venue_name.parameterize}"
  end
  
end
