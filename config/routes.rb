Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, :authors, :author_books
  get '/books/:id/add_author', to: 'books#add_author', as: 'add_author'
end
