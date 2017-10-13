Rails.application.routes.draw do
  namespace :admin do
    resources :menus
  end
  namespace :admin do
      root 'base#index'
      get 'login', to: 'base#login', as: 'login'
      post 'login', to: 'base#do_login', as: 'do_login'
      get 'logout', to: 'base#logout', as: 'logout'
      
      resources :pages
      resources :comments
      resources :users do
        get :newpass, to:'users#new_password', as:'new_password'
        patch :changepass, to:'users#change_password', as:'change_password' 
      end
      resources :categories
      resources :posts
  end
    
    resources :posts, except: [:edit, :update, :add, :create, :destroy]
    get 'blog', to:'posts#index'
    get ':slug-:id-blog', to:'posts#show', as:'post_show'
    get ':slug-:id', to:"pages#show", as:"page_show"
    
    get "category/:id", to:"posts#category", as:"post_by_category"
    get "kategori/:slug", to:"posts#category", as:"post_by_category_with_slug"
    
    root 'homes#index'
    
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
