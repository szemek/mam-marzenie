json.array!(@dreams) do |dream|
  json.extract! dream, :id, :title, :description, :child_fullname, :child_age, :region, :category, :status
  json.url dream_url(dream, format: :json)
end
