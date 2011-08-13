class ApplicationController < ActionController::Base
  protect_from_forgery
 
 before_filter :find_random_photo

protected

  def find_random_photo
    @random_photo = Photo.random
  end
end
