json.extract! contact, :id, :name, :image, :organization, :preferred_method, :personal_number, :work_number, :email, :instagram_url, :facebook_url, :owner_id, :created_at, :updated_at
json.url contact_url(contact, format: :json)
