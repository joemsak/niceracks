module Admin
  class LadiesController < Admin::BaseController

    crudify :lady,
            :title_attribute => 'name'

    def index
      search_all_ladies if searching?
      paginate_all_ladies

      render :partial => 'ladies' if request.xhr?
    end

  end
end
