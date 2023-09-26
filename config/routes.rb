Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'menus/main' => 'menus#main', as: 'menus_main'
  get 'menus/zensai' => 'menus#zensai'
  get 'menus/drink' => 'menus#drink'
  get 'menus/cake' => 'menus#cake'

  resources :menus do
  resources :likes, only: [:create]

  get 'menus/:menu_id/likes' => 'likes#create'
  get 'menus/:menu_id/likes/:id' => 'likes#destroy'
  end

  root 'menus#index'

end
