Rails.application.routes.draw do
  # public
  devise_for :members,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  scope module: 'public' do
    root to: "homes#top"
    get "/about" => "homes#about", as: "about"
    get "/members/my_page" => "members#my_page"
    get "/posts/my_posts" => "posts#my_posts"
    resources :members, except: [:new, :create] do
      member do
        get :favorite
      end
    end
    resources :posts do
      resources :comments, only: [:create, :destroy]
      collection do
        get "top"
        get "search"
      end
      resources :favorites, only: [:create, :destroy]
    end
  end

  # admin
  namespace :admin do
    root to: "homes#top"
    resources :members, only: [:show, :index]
    resources :posts, only: [:show, :index]
  end
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
