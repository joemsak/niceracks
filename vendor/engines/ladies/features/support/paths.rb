module NavigationHelpers
  module Refinery
    module Ladies
      def path_to(page_name)
        case page_name
        when /the list of ladies/
          admin_ladies_path

         when /the new lady form/
          new_admin_lady_path
        else
          nil
        end
      end
    end
  end
end
