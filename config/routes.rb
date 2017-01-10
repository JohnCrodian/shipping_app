Rails.application.routes.draw do
  get 'profiles/index'

  get 'profiles/new'

  get 'profiles/show'

  get 'profiles/create'

  get 'profiles/update'

  get 'profiles/edit'

  get 'profiles/destroy'

  get 'static_pages/home'

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/help'

  resources :jobs, :boats, :profiles

  devise_for :views
  devise_for :users, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
