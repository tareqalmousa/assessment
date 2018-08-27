Rails.application.routes.draw do
  
  namespace 'api' do
    namespace 'v1' do 
      
    get '/urls/getall' ,  to:'urls#getall'
      
    post '/urls/create' ,  to:'urls#create'
      
    post '/urls/general' ,  to:'urls#general'
   
      # resources :urls do
      #end
  
    end
  end
  root :to => "home#index"
  #get 'home/index'
  post 'home/create' => 'home#create'
  resources :urls

  get '/*path',  to: 'home#general'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
