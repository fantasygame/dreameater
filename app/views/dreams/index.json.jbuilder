json.array!(@dreams) do |dream|
  json.extract! dream, :id, :title, :content, :user_id
  json.url dream_url(dream, format: :json)
end
