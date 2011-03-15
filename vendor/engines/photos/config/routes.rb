Refinery::Application.routes.draw do
  resources :photos, :only => [:index, :show]
  get 'photos/tagged/:tag_name' => 'photos#tagged', :as => 'tagged_photos'

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :photos, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
