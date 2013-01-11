Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :promotions do
    resources :promotions, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :promotions, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :promotions, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
