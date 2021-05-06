Rails.application.routes.draw do
  # get 'items/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :tweets, only: :index
  # root to: 'prototypes#index'

  root to: 'items#index'
end


# 先にコントローラーを実装 items
# modelは後で消す必要があるかもしれない。
# 再度、マイグレート修正する必要あり？