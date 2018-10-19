Rails.application.routes.draw do

  scope "api" do
    get 'users/validate_email' => "users#validate_email"
  end
end
