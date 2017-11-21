Rails.application.routes.draw do
  get 'admin/configuration'

  get 'admin/new'

  get 'admin/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'home' => 'public#home'
  root 'public#home'

  get 'admin' => 'admin#configuration'

end
