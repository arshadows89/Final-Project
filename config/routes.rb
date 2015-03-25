Rails.application.routes.draw do
  
  root 'home#index'
  get '/admin', to: 'home#admin_login'
  get '/admin_home', to: 'home#admin_home'

  get '/admin_update_contact', to: 'home#admin_update_contact'
  post '/admin_update_contact_info_post', to: 'home#admin_update_contact_info_post'

  get '/admin_update_current_work', to: 'home#admin_update_current_work'
  get '/admin_update_current_work_home', to: 'home#admin_update_current_work_home'
  post '/admin_update_current_work_post', to: 'home#admin_update_current_work_post'


  get '/admin_update_slide_show', to: 'home#admin_update_slide_show'
  get '/admin_create_slide_show', to: 'home#admin_create_slide_show'
  post '/admin_create_slide_show_post', to: 'home#admin_create_slide_show_post'
  delete '/admin_delete_slide_show_path/:id', to: 'home#admin_delete_slide_show_path'


  get '/admin_update_past_work', to: 'home#admin_update_past_work'
  get '/admin_create_past_work', to: 'home#admin_create_past_work'
  post '/admin_create_past_work_post', to: 'home#admin_create_past_work_post'
  delete '/admin_delete_past_work_path/:id', to: 'home#admin_delete_past_work_path'


  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :projects do
    resources :rooms do
      resources :pictures
    end
  end
  get '/project_info/:id', to: 'projects#project_info'
  get '/project_show/:id', to: 'projects#project_show'

  post '/admin_create_room_post/:project_id', to: 'home#admin_create_room_post', as: 'room_project'
 

  resources :slideshows

  resources :pastworks

end