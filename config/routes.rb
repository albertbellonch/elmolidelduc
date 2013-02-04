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
      resources :images, :except => :show
      root :to => "images#index"
    end

    match 'events' => 'static#events'
    match 'farinera' => 'static#farinera'
    root :to => "static#index"
  end
end
