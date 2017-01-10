Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/help'

  get 'jobs/index'

  get 'jobs/new'

  get 'jobs/show'

  get 'jobs/create'

  get 'jobs/edit'

  get 'jobs/update'

  get 'jobs/destroy'

  get 'boats/index'

  get 'boats/new'

  get 'boats/show'

  get 'boats/create'

  get 'boats/edit'

  get 'boats/update'

  get 'boats/destroy'

  devise_for :views
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
