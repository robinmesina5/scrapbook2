json.array!(@scrapbooks) do |scrapbook|
  json.extract! scrapbook, :id
  json.url scrapbook_url(scrapbook, format: :json)
end
