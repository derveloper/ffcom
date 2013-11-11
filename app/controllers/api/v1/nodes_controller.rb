class Api::V1::NodesController < NodesController
  resource_description do
    resource_id 'nodes'
    api_versions '1'
  end

  before_action :set_node, only: [:show, :edit, :update, :destroy]

  # GET /api/1/nodes
  # GET /api/1/nodes.json
  def index
    @nodes = Node.all
  end

  # GET /api/1/nodes/1
  # GET /api/1/nodes/1.json
  def show
  end

  # GET /api/1/nodes/new
  def new
    @node = Node.new
  end

  # GET /api/1/nodes/1/edit
  def edit
  end

  # POST /api/1/nodes
  # POST /api/1/nodes.json
  api :POST, "/nodes", "Register a node"
  def create
    @node = Node.new(node_params)

    respond_to do |format|
      if @node.save
        format.html { redirect_to @node, notice: 'Node was successfully created.' }
        format.json { render action: 'show', status: :created, location: @node }
      else
        format.html { render action: 'new' }
        format.json { render json: @node.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/1/nodes/1
  # PATCH/PUT /api/1/nodes/1.json
  def update
    respond_to do |format|
      if @node.update(node_params)
        format.html { redirect_to @node, notice: 'Node was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @node.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/1/nodes/1
  # DELETE /api/1/nodes/1.json
  def destroy
    @node.destroy
    respond_to do |format|
      format.html { redirect_to nodes_url }
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
