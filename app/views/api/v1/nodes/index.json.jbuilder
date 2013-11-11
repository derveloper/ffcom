json.array!(@api_v1_nodes) do |api_v1_node|
  json.extract! api_v1_node, 
  json.url api_v1_node_url(api_v1_node, format: :json)
end
