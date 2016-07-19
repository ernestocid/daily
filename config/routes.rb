Rails.application.routes.draw do
  root 'welcome#index'
  get "teams/my_teams", to: "teams#my_teams"

  resources :teams do
    member do
      post "add_member", to: "teams#add_member"
    end
  end

  resources :daily_entries
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
