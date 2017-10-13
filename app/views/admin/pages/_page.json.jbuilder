json.extract! page, :id, :title, :keywords, :desc, :parent, :content, :image, :status, :created_at, :updated_at
json.url page_url(page, format: :json)
