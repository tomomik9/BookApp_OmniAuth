Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations', 
    :omniauth_callbacks => "users/omniauth_callbacks"
   }
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope "(:locale)" do
   resources :books
  end
  if Rails.env.development? #開発環境の場合
   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
