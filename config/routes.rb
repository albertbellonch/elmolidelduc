Encen::Application.routes.draw do
  constraints(:host => /^www\./) do
    # Won't match root path without brackets around "*x". (using Rails 3.0.3)
    match "(*x)" => redirect { |params, request|
      request.url.gsub(/^http:\/\/www\./, "http://")
    }
  end

  post "toggle_edition_mode", :to => "application#toggle_edition_mode"
  get "unsubscribe", :to => "mailchimp#unsubscribe"

  resources :subscriptors, :only => :create

  match "/" => redirect("/ca")
  match "info", :to => "static#info"

  scope "(:locale)" do
    devise_for :users, :controllers => {:sessions => 'user_sessions'}

    namespace :admin do
      resources :users, :except => :index
      resources :subscriptors, :only => [:index, :destroy]

      resources :posts do
        resources :comments, :only => :create
        resources :images, :only => :create
      end

      resources :comments, :only => :destroy
      resources :images, :only => :destroy

      resources :pages, :only => [:new, :create, :index, :destroy, :edit, :update] do
        resources :images, :only => :create
        resources :page_contents, :only => [:edit, :update, :destroy, :new, :create]
      end

      root :to => "users#index"
    end

    root :to => "static#index"
  end
end
