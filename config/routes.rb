Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #public and defult view
  get 'home' => 'public#home'
  root 'public#home'

  #configuration views
  get 'admin_cam' => 'admin#cam_configuration'
  get 'admin_lot' => 'admin#lot_configuration'

  #query views
  get 'query' => 'admin#admin_query'
  get 'admin_query' => 'admin#admin_query'

  #login views
  get 'admin' => 'admin#login'
  get 'login' => 'admin#login'

end
