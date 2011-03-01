module NavigationHelpers
  module Refinery
    module Performances
      def path_to(page_name)
        case page_name
        when /the list of performances/
          admin_performances_path

         when /the new performance form/
          new_admin_performance_path
        else
          nil
        end
      end
    end
  end
end
