json.extract! category, :id, :title, :desc, :parent, :status, :created_at, :updated_at
json.url category_url(category, format: :json)
