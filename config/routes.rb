Rails.application.routes.draw do
  get 'dashboard/index', to: 'dashboard#index', as: :dashboard_index
  get 'dashboard/normal', to: 'dashboard#normal', as: :dashboard_normal
  get 'get/project', to: 'projects#select', as: :selection_project

  post 'projects/create_repos' => 'projects#create_repos'
  get 'projects/show_repository_project', to: 'projects#show_repository_project', as: :show_repository

  root to: 'dashboard#index'
  resources :languages
  resources :task_requirements
  resources :user_tasks
  resources :user_abilities
  resources :user_languages

  # Rotas devise
  devise_for :users, controllers: {registrations: 'users/registrations'}
  get 'users/change_approved/:id', to: 'users#change_approved', as: :change_approved
  scope "/administrador" do
    resources :users
  end

  resources :projects do
    resources :function_user_projects
    resources :releases
    resources :sprints do
      resources :user_stories do # Recurso carregado duas vezes para facilitar no controler
        resources :tasks
      end
    end

    resources :themes do
      resources :user_stories do
        resources :user_story_acceptance_criterions
      end
    end
  end

  resources :locals
  resources :functions
  resources :abilities
end
