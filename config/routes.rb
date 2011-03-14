Rails.application.routes.draw do
  namespace :free_relic do
    resources :dashboard, :only => [:index, :destroy]
    resources :metrics, :only => [:index, :destroy]
    
    resources :sqlmetrics do
      get :slowest, :on => :collection
    end
    
    resources :httpmetrics do
      get :slowest, :on => :collection
    end
  end

  match 'free_relic' => 'free_relic/metrics#index', :as => :free_relic_index
end

