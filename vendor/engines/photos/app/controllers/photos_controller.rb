class PhotosController < ApplicationController

  before_filter :find_all_photos
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @photo in the line below:
    present(@page)
  end

  def show
    @photo = Photo.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @photo in the line below:
    present(@page)
  end

protected

  def find_all_photos
    @photos = Photo.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/photos")
  end

end
