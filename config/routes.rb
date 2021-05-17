Rails.application.routes.draw do
  resources :announcements
  root to: 'announcements#index'
end
