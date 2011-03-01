Refinery::Application.routes.draw do
  resources :ladies, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :ladies, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
