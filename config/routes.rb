Rails.application.routes.draw do
  # get 'users/show'
  # get 'users/edit'
  # get 'post_images/new'
  # get 'post_images/index'
  # get 'post_images/show'
  root to: "homes#top"
  get 'homes/about'
  devise_for :users
  resources :users, only: [:show, :edit] 
  resources :post_images, only: [:new, :index, :show, :create, :destroy] do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  

   

  # devise_for :users
  # get 'homes/top'
  root to: "homes#top"
  get 'homes/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
# resources メソッドは、ルーティングを一括して自動生成してくれる機能です。
# post_comments#creates しようと思ったら　:post_image_idがないとコメント投稿できなくなる
# params[:post_image_id]でPostImageのidが取得できるようになります。