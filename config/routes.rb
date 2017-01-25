Rails.application.routes.draw do

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {registrations: 'users/registrations', sessions: 'sessions'}
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get 'buying_requests/filter' => 'buying_requests#filter', as: "buying_requests_filter"
  resources :buying_requests

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get "/contacts/new" => 'welcome#new_contact'
  post "/contacts" => 'welcome#create_contact'
  get 'faq' => 'welcome#faq'
  get 'terms-conditions' => 'welcome#terms_and_conditions'
  get 'about' => 'welcome#about_us'
  get 'why-us' => 'welcome#why_us'
  get 'user-agreement' => 'welcome#user_agreement'
  get 'our-services' => 'welcome#our_services'
  get 'how-we-work' => 'welcome#how_we_work'
  get 'our-policy' => 'welcome#our_policy'
  get 'good-to-know' => 'welcome#good_to_know'
  get 'country-frequency' => 'welcome#country_frequency'
  post 'send-equipment-enquiry' => 'welcome#create_equipment_enquiry'
  get 'equipment_details/:id' => 'equipments#equipment_details', as: "equipment_details"
  get 'listings' => 'equipments#index'
  get 'listings/filter' => 'equipments#filter', as: "listing_filter"
  get 'add_favourite' => 'equipments#add_favourite'
  get 'remove_favourite' => 'equipments#remove_favourite'

  authenticate :user do
    namespace :seller do
      get 'dashboard' => 'dashboard#index'
      resources :profile, only: [:edit, :update]
      resources :buying_requests
      resources :buying_proposals, only: [:index, :new, :create, :show]
      get 'request_for_more_info' => 'buying_requests#request_for_more_info', as: :request_for_more_info
      post 'send_request_for_more_info' => 'buying_requests#send_request_for_more_info', as: :send_request_for_more_info
      
      get 'my_buying_request_list' => 'buying_requests#my_buying_request_list', as: :my_buying_request_list
      get 'my_buying_request/:id' => 'buying_requests#my_buying_request_show', as: :my_buying_request
      
      get 'received_proposals' => 'buying_proposals#received_proposals', as: :received_proposals
      get 'received_proposal/:id' => 'buying_proposals#received_proposals_show', as: :received_proposal
      
      get 'listings/filter' => 'equipment#filter', as: "listing_filter"
      resources :equipment
      get 'fetch_categories' => 'equipment#categories'
      get 'fetch_categories_by_category_type' => 'equipment#categories_by_category_type'
      resources "equipment-enquiries", only: [:index, :show, :destroy], :controller => :equipment_enquiries, :as => :equipment_enquiries do
        collection do
          get 'unread'
        end
      end
      get 'questions' => 'equipment_enquiries#questions', as: "questions"
      get 'question/:id' => 'equipment_enquiries#show_question', as: "question"
      delete 'question/:id' => 'equipment_enquiries#destroy'
      get 'offers' => 'equipment_enquiries#offers', as: "offers"
      get 'offer/:id' => 'equipment_enquiries#show_offer', as: "offer"
      delete 'offer/:id' => 'equipment_enquiries#destroy'
      put 'respond_to_offer/:id' => 'equipment_enquiries#respond_to_offer', as: "respond_to_offer"
      post 'reply_to_question/:id' => 'equipment_enquiries#reply_to_question', as: "reply_to_question"
      resources :messages, only: [:show, :new, :create] do
        collection do
          get 'inbox'
          get 'sentbox'
          get 'autocomplete'
          post 'remove'
          get 'unread'
        end
        member do
          post :reply
          post :trash
          post :untrash
        end
      end
      
      get 'orders' => 'order#index', as: "orders"
      get 'orders/:id' => 'order#show', as: "order"
      get 'invoices' => 'order#invoices', as: "invoices"
      put 'order_update/:id' => 'order#update', as: "orders_update"
      get 'update_shipping/:id' => 'order#update_shipping', as: "update_shipping"
      post 'save_shipping/:id' => 'order#save_shipping', as: "save_shipping"
      get 'order_invoice/:id' => 'order#download_invoice', as: "order_invoice"
      get 'favourites' => 'equipment#favourites', as: "favourites"
      delete 'remove_favourite/:id' => 'equipment#remove_favourite', as: "remove_favourite"
      get 'add_preference' => 'equipment#add_preference'
      get 'remove_preference' => 'equipment#remove_preference'
      get 'ask_for_services' => 'dashboard#ask_for_services'
      get 'available_for_preview' => 'equipment#available_for_preview'

      # routing for enquiry center
      get 'inquiry-center' => 'inquiry_center#index', as: 'inquiry_center' 
      
    end
        
  end

  namespace :admin do
    get 'accept_request' => 'buying_requests#accept_request'
    get 'accept_proposal' => 'buying_requests#accept_proposal'
    get 'accept_info_request' => 'buying_requests#accept_info_request'
    get 'edit_and_accept_info_request' => 'buying_requests#edit_and_accept_info_request'
    put 'update_and_accept_info_request' => 'buying_requests#update_and_accept_info_request'
    # patch 'update_and_accept_info_request' => 'buying_requests#update_and_accept_info_request'
    get 'edit_and_accept_proposal' => 'buying_requests#edit_and_accept_proposal'
    put 'update_and_accept_proposal' => 'buying_requests#update_and_accept_proposal'
    # patch 'update_and_accept_proposal' => 'buying_requests#update_and_accept_proposal'

    get 'approve_enquiry_request' => 'equipment_enquiries#approve_enquiry'
    post 'send_reply/:id' => 'contact_requests#send_reply', as: :create_reply
    get 'download_proposal_attachemnt' => 'buying_proposals#download'
    get 'edit_page_content' => 'page_content_managements#edit_page_content'
    post 'save_page_content' => 'page_content_managements#save_page_content'
  end
end

