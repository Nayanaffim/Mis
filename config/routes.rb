Rails.application.routes.draw do




  devise_for :users, :controllers => { :registrations => "registrations"}
  devise_scope :user do
    get '/signout', to: 'devise/sessions#destroy', as: :signout
  end  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get 'users/soft_delete' => 'users/soft_delete'
  root 'users#index'

  # You can have the root of your site routed with "root"
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  resource :user, only: [:edit] do
    collection do
      get 'edit_password'
      patch 'update_password'
    end
  end 

  # Example resource route with options:
  resources :users do
    resources :employees do
      collection do

        get "dashboard"
        get "send_email" 
        get    'employee_dashboard'
        get    'academic_detail_new'
        post   'academic_detail_create'
        get    'academic_detail_edit'
        patch  'academic_detail_update'
        get    'academic_detail_display'
        get    'basic_detail_new'
        post  'basic_detail_create'
        get    'basic_detail_show'
        get    'basic_detail_edit'
        patch  'basic_detail_update'
        get    'bank_detail_new'
        post   'bank_detail_create'
        get    'bank_detail_show'
        get    'bank_detail_edit'
        patch  'bank_detail_update'
        get    'previous_company_detail_new'
        get    'previous_company_detail_show'
        post   'previous_company_detail_create'
        get    'previous_company_detail_edit'
        patch  'previous_company_detail_update'
        get    'project_new'
        post   'project_create'
        get    'project_show'
        get    'project_edit'
        patch  'project_update'
       end

      end

      resources :sales_consultants do
        collection do
        get    'saleconsultant_new'
        post   'saleconsultant_create'
        get    'saleconsultant_edit'
        get    'saleconsultant_show'
        patch  'saleconsultant_update'
        get    'sales_bd_new'
        post   'sales_bd_create'
        get    'sales_bd_edit'
        get     'sales_bd_show'
        patch  'sales_bd_update'

      end
    end    
  end 
end
