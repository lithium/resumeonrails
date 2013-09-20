Resume::Application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  # route all other urls to the page controller
  get ':slug' => 'pages#page'
  # including /
  root 'pages#page'

end
