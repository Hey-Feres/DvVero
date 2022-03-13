Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get :presentation, to: 'static_presentation#index'
  root 'home#index'
end
