json.extract! user_csv_upload, :id, :name, :created_at, :updated_at
json.url user_csv_upload_url(user_csv_upload, format: :json)