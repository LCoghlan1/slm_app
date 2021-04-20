json.extract! document, :id, :name, :description, :key, :created_at, :updated_at
json.url document_url(document, format: :json)
