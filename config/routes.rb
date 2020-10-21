Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    scope module: "api/v1", as: "api" do
      resources :memberships

      resources :teams

      resources :topics

      resources :messages

      resources :rooms

      resources :users
    end
    mount VandalUi::Engine, at: "/vandal"
    # your routes go here
  end
  ActiveAdmin.routes(self)
  root to: "users#index"
  resources :memberships
  resources :teams
  resources :topics
  resources :messages
  resources :rooms
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
