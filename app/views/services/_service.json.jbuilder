json.extract! service, :id, :name, :email, :password_digest, :contact, :service_type, :created_at, :updated_at
json.url service_url(service, format: :json)
