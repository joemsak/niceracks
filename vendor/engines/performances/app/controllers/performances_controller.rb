class PerformancesController < ApplicationController

  before_filter :find_all_performances
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @performance in the line below:
    present(@page)
  end

  def show
    @performance = Performance.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @performance in the line below:
    present(@page)
  end

protected

  def find_all_performances
    @performances = Performance.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/performances")
  end

end
