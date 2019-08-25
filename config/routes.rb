Rails.application.routes.draw do
  devise_for :drivers
 root to: "bookings#new"
  devise_for :users

  scope :user do
  	resource :bookings, only: [:show,:new,:create] do 
  		collection do
  		 get "mark_complete"
  		 post "completed"
  		 get 'start'
  		 post 'started'
  		end
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
