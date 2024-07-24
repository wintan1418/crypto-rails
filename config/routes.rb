Rails.application.routes.draw do
  get 'crypto', to: 'crypto#index'
  get 'crypto/check', to: 'crypto#check', as: 'crypto_check'
end
