json.extract! user, :id, :name, :nickname, :email, :country, :city, :biography, :password, :created_at, :updated_at
json.url user_url(user, format: :json)
