Rails.application.routes.draw do
  delete "user/:id/phone/:ids",to: "phone#destroy", as: 'phone_destroy'
  post "user/:id/phone",to: "phone#create", as: 'phone_create'
  delete "user/:id", to: "user#destroy" , as: 'user_destroy'
  put "user/:id", to: "user#update" , as: 'user_edit'
  get "user/:id/edit", to: "user#edit", as: 'user_edited'
  post "user",to: "user#create"
  get "user/new",to: "user#new" , as: 'user_new'
  get "user/:id",to: "user#show" , as: 'user_show'
  get "user",to: "user#index"

  # we can use the standard routes or we can customize them according to out need

  # resources :user do
  #   resources :photo
  # end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
