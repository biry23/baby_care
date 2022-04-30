Rails.application.routes.draw do
  namespace :public do
    get 'comments/index'
    get 'comments/show'
  end
  namespace :public do
    get 'posts/new'
    get 'posts/index'
    get 'posts/edit'
    get 'posts/show'
  end
  namespace :public do
    get 'members/show'
    get 'members/edit'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'posts/index'
    get 'posts/show'
  end
  namespace :admin do
    get 'members/index'
    get 'members/show'
  end
  namespace :admin do
    get 'homes/top'
  end
  # public
  devise_for :members,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  scope module: 'public' do
    root to: "homes#top"
    get "/about" => "homes#about", as: "about"
    get "/members/my_page" => "members#show", as: "members"
    get "/members/edit" => "members#edit", as: "members_edit"
    patch "/members" => "members#update", as: "members_update"
    resources :posts do
      collection do
        get "top"
      end
      resources :favorites, only: [:create, :destroy]
    end
    resources :comments, except: [:new, :edit, :update]
  end
  
  # admin
  namespace :admin do
    root to: "homes#top"
    resources :members, only: [:show, :index]
    resources :posts, only: [:show, :index]
    resources :genres, except: [:destroy, :show, :new]
  end
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
