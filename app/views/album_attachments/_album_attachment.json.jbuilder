json.extract! album_attachment, :id, :album_id, :avatar, :created_at, :updated_at
json.url album_attachment_url(album_attachment, format: :json)
