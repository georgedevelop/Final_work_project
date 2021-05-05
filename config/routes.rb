Rails.application.routes.draw do
  scope '/dashboard' do
      resources :parts, :vendors, :policies, :roles, :part_orders, :work_orders, :work_order_requests
      get 'part/search', to: 'parts#search'
      get 'vendor/search', to: 'vendors#search'
      get 'role/search', to: 'roles#search'
      get 'policy/search', to: 'policies#search'
      get 'part_order/search', to: 'part_orders#search'
      get 'part_order/search_vendor', to: 'part_orders#search_vendor'
      get 'part_order/search_name', to: 'part_orders#search_name'
      get 'work_order/calendar', to: 'work_orders#calendar'
      get 'work_order/events', to: 'work_orders#events'
      post 'work_order_requests/:id/confirm', to: 'work_order_requests#confirm', as: :work_order_request_confirm
      post 'work_order_requests/:id/deny', to: 'work_order_requests#deny', as: :work_order_request_deny
      get 'part_order/:id/receipt', to: "part_orders#receipt", as: :part_order_receipt
      get 'part_order_receipts', to: "part_orders#receipts", as: :part_order_receipts
      put 'part_items/:id', to: "part_items#update", as: :part_item_update
  end
  get 'dashboard_unauth/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "dashboard#index"

  get 'dashboard/users', to: 'users#index'
  put 'dashboard/users/:id', to: 'users#update_role', as: :user_update_roles

  get 'dashboard_unauth/orders', to: 'dashboard_unauth#orders'
  get 'dashboard_unauth/products', to: 'dashboard_unauth#products'
  get 'dashboard_unauth/customers', to: 'dashboard_unauth#customers'
  get 'dashboard_unauth/users', to: 'dashboard_unauth#users'
  get 'dashboard_unauth/departments', to: 'dashboard_unauth#departments'



end
