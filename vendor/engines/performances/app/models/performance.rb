class Performance < ActiveRecord::Base
  
  default_scope where(['ends_at < ?', Time.now]).order('starts_at ASC')

  acts_as_indexed :fields => [:venue_name, :cost, :description, :link]

  validates :name, :presence => true, :uniqueness => true
  
  has_friendly_id :date_and_name, :use_slug => true
  
  def title
    "#{starts_at.strftime '%b %d'} #{name}"
  end
  
  private
  
  def date_and_name
    "#{starts_at.strftime '%m-%d-%Y'}-#{name.parameterize}"
  end
  
end
