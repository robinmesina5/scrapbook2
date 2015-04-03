json.array!(@relatives) do |relative|
  json.extract! relative, :id, :first_name
  json.url relative_url(relative, format: :json)
end
