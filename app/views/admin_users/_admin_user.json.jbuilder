json.extract! admin_user, :id, :username, :user_id, :permission, :status, :updated_by, :created_by, :created_at, :updated_at
json.url admin_user_url(admin_user, format: :json)