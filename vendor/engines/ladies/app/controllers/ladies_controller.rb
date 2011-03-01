class LadiesController < ApplicationController

  before_filter :find_all_ladies
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @lady in the line below:
    present(@page)
  end

  def show
    @lady = Lady.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @lady in the line below:
    present(@page)
  end

protected

  def find_all_ladies
    @ladies = Lady.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/ladies")
  end

end
