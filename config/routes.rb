ActionController::Routing::Routes.draw do |map|
  map.resources :tags

  map.resources :languages

  map.resources :comments

  map.resources :test_outputs

  map.resources :systems

  map.resources :networks

  map.resources :users

  map.resources :tasks, :has_many => [:scripts]

  map.resources :sessions, :only => [:new, :create, :destroy]

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  map.connect 'comments/:id/upvote', :controller => 'comments', :action => 'upvote'
  map.connect 'scripts/:id/upvote', :controller => 'scripts', :action => 'upvote'
  map.connect 'test_outputs/:id/upvote', :controller => 'test_outputs', :action => 'upvote'

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end
  map.register  '/register',  :controller => 'users',    :action => 'new'
  map.tasks     '/tasks',     :controller => 'tasks',    :action => 'index'
  map.about     '/about',     :controller => 'pages',    :action => 'about'
  map.contact   '/contact',   :controller => 'pages',    :action => 'contact'
  map.login     '/login',     :controller => 'sessions', :action => 'new'
  map.logout    '/logout',    :controller => 'sessions', :action => 'destroy'

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"
  map.root :controller => 'pages', :action => 'home'

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  #map.connect ':controller/:action/:id'
  #map.connect ':controller/:action/:id.:format'
end
