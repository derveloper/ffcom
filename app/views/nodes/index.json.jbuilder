json.array!(@nodes) do |node|
  json.extract! node, :mac_address, :pub_key, :user_id
  json.url node_url(node, format: :json)
end
