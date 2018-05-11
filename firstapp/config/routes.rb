Rails.application.routes.draw do
  get 'welcome/index'
  resources :articles do
  	resources :comments #This creates comments as a nested resource 
  	#within articles. This is another part of capturing the hierarchical
  	# relationship that exists between articles and comments.
  end
  
  root 'welcome#index' #trang chu khi chay la trang index cua controller Welcome
end
