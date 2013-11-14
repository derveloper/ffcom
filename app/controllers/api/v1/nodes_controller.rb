class Api::V1::NodesController < NodesController
  resource_description do
    resource_id 'nodes'
    api_versions '1'
    formats ['json']
  end

  def_param_group :node do
    param :mac_address, String, 'MAC address of the node'
    param :pub_key, String, 'Public key for fastd'
  end

  before_action :set_node, only: [:show, :edit, :update, :destroy]

  # GET /api/1/nodes
  # GET /api/1/nodes.json
  api :GET, "/1/nodes", "List nodes"
  def index
    @nodes = Node.all
  end

  # GET /api/1/nodes/1
  # GET /api/1/nodes/1.json
  api :GET, "/1/nodes/:id", "Show a node"
  example 'node'
  def show
  end

  # POST /api/1/nodes
  # POST /api/1/nodes.json
  api :POST, "/1/nodes", "Create a node"
  param_group :node
  example " { 'message': 'success', 'id': 1 } "
  def create
    @node = Node.new(node_params)

    respond_to do |format|
      if @node.save
        format.json { render action: 'show', status: :created, location: @node }
      else
        format.json { render json: @node.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_node
      @node = Node.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def node_params
      params.require(:node).permit(:mac_address, :pub_key, :user_id)
    end
end
