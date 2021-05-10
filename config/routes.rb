Rails.application.routes.draw do
  
  devise_for :users
  root to: 'items#index'
end


# 先にコントローラーを実装 items
# modelは後で消す必要があるかもしれない。
# 再度、マイグレート修正する必要あり？railπ