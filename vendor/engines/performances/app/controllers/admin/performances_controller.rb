module Admin
  class PerformancesController < Admin::BaseController

    crudify :performance,
            :title_attribute => 'venue_name'

    def index
      search_all_performances if searching?
      paginate_all_performances

      render :partial => 'performances' if request.xhr?
    end

  end
end
