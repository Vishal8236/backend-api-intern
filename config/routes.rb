Rails.application.routes.draw do

  scope "/api" do
    #login and logout routes
    post '/login', to: 'dhwaniapis#login'
    get '/logout', to: 'dhwaniapis#logout'

    #create and show states
    scope "/state" do
      post '/create', to: 'states#create'
      get '/get-state', to: 'states#index'
    end
  end
  
end
