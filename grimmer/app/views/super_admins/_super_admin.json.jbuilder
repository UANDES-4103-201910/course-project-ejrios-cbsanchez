json.extract! super_admin, :id, :name, :password, :nickname, :email, :e_password, :created_at, :updated_at
json.url super_admin_url(super_admin, format: :json)
