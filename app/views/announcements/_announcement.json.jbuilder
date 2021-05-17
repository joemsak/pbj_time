json.extract! announcement, :id, :title, :content, :published_at, :created_at, :updated_at
json.url announcement_url(announcement, format: :json)
