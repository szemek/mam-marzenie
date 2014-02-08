json.array!(@sponsors) do |sponsor|
  json.extract! sponsor, :id, :fullname, :description, :email, :phone
  json.url sponsor_url(sponsor, format: :json)
end
