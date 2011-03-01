Refinery::Application.routes.draw do
  resources :performances, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :performances, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
