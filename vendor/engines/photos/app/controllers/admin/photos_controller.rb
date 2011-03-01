module Admin
  class PhotosController < Admin::BaseController

    crudify :photo,
            :title_attribute => 'caption'

    def index
      search_all_photos if searching?
      paginate_all_photos

      render :partial => 'photos' if request.xhr?
    end

  end
end
