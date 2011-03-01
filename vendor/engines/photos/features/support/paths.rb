module NavigationHelpers
  module Refinery
    module Photos
      def path_to(page_name)
        case page_name
        when /the list of photos/
          admin_photos_path

         when /the new photo form/
          new_admin_photo_path
        else
          nil
        end
      end
    end
  end
end
