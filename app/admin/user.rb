ActiveAdmin.register User do

  index do
    column :username
    # column :current_sign_in_at
    # column :last_sign_in_at
    # column :sign_in_count
    actions
  end

  # Default is :email, but we need to replace this with :username
  filter :username

  # This is the form for creating a new user using the Admin
  # backend. If you have added additional attributes to the
  # User model, you need to include them here.
  form do |f|
    f.inputs "User Details" do
      f.input :username
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  # This is related to Rails 4 and how it handles strong parameters.
  # Here we replace :email with :username.
  controller do
    def permitted_params
      params.permit user: [:username, :password, :password_confirmation]
    end
  end
end
