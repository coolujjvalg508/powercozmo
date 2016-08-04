Rails.application.routes.draw do

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {registrations: 'users/registrations'}
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
  #get '/user/edit' => 'users#edit'

  authenticate :user do
    namespace :seller do
      get 'dashboard' => 'dashboard#index'
      resources :profile, only: [:edit, :update]
      resources :buying_requests
      resources :buying_proposals, only: [:index, :new, :create, :show]
      get 'request_for_more_info' => 'buying_requests#request_for_more_info', as: :request_for_more_info
      post 'send_request_for_more_info' => 'buying_requests#send_request_for_more_info', as: :send_request_for_more_info
      get 'listings/filter' => 'equipment#filter', as: "listing_filter"
      resources :equipment
      get 'fetch_categories' => 'equipment#categories'
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
    end
    
    
    namespace :buyer do
      get 'dashboard' => 'dashboard#index'
      resources :profile, only: [:edit, :update]
      resources :buying_requests
      resources :buying_proposals, only: [:index, :new, :create, :show]
      get 'request_for_more_info' => 'buying_requests#request_for_more_info', as: :request_for_more_info
      post 'send_request_for_more_info' => 'buying_requests#send_request_for_more_info', as: :send_request_for_more_info
      get 'listings/filter' => 'equipment#filter', as: "listing_filter"
      resources :equipment
      get 'fetch_categories' => 'equipment#categories'
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
    end
    
    
    namespace :user do
      resources :profile, only: [:edit, :update]
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
  end
end

