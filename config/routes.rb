Rails.application.routes.draw do
  resources :announcements
  root to: 'public/announcements#index'
end
