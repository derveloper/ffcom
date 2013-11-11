json.array!(@nodes) do |node|
  json.extract! node, :mac_address, :user_id
  json.url node_url(node, format: :json)
end
