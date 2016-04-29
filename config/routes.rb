Rails.application.routes.draw do
  resources :tests,
    path_names: {new: "tests", show: "profile"}
  get 'quiz/new'
  get 'users/new'
  get 'home' => 'static_pages#home'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  root 'static_pages#home'
  get 'login' => 'sessions#login'
  post 'login' => 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get "/auth/:provider/callback" => 'sessions#oauth'
  resources :users,
    only: [:new, :create, :show, :edit, :update],
    path_names: {new: "signup", show: "profile"}
  resources :questions
  resources :options

  resources :tests, path_names: {new: "tests", show: "profile"}
  get 'current_test/:id' => 'tests#take', as: 'take_test'
  patch 'submit/:id' => 'tests#submit_test', as: 'submit'
  post 'submit_contact_form' => 'static_pages#submit_contact_form'
end
