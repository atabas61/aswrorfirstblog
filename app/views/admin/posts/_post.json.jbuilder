json.extract! post, :id, :title, :keywords, :desc, :category_id, :user_id, :content, :image, :status, :created_at, :updated_at
json.url post_url(post, format: :json)
