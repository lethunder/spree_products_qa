Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :products do
      resources :product_questions, path: :questions
    end

    resources :product_questions, only: [] do
      collection do
        get :pending
      end
    end
  end

  resources :product_questions, only: [:create, :new, :index]

  namespace :api, defaults: { format: 'json' } do
    namespace :v2 do
      namespace :storefront do
        resources :products, only: [] do
          resources :product_questions, only: [:index, :create]
        end

        namespace :account do
          resources :product_questions_answers, controller: :product_questions_answers, only: %i[index]
        end
      end
    end
  end
end
