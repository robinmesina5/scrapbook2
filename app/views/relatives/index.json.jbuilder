json.array!(@relatives) do |relative|
  json.extract! relative, :id
  json.url relative_url(relative, format: :json)
end
