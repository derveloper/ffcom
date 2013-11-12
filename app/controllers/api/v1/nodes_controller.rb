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
  api :GET, "/nodes", "Fetch all nodes"
  def index
    @nodes = Node.all
  end

  # GET /api/1/nodes/1
  # GET /api/1/nodes/1.json
  api :GET, "/nodes/:id", "Get node info"
  example 'node'
  def show
  end

  # POST /api/1/nodes
  # POST /api/1/nodes.json
  api :POST, "/nodes", "Register a node"
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

  # PATCH/PUT /api/1/nodes/1
  # PATCH/PUT /api/1/nodes/1.json
  api :PUT, "/nodes/:id", "Update a node"
  param_group :node
  example " { 'message': 'success', 'id': 1 } "
  def update
    respond_to do |format|
      if @node.update(node_params)
        format.json { head :no_content }
      else
        format.json { render json: @node.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/1/nodes/1
  # DELETE /api/1/nodes/1.json
  api :DELETE, "/nodes/:id", "Delete a node"
  def destroy
    @node.destroy
    respond_to do |format|
      format.json { head :no_content }
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
