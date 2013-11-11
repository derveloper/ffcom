class HomeController < ApplicationController
  def index
    @nodes = Node.all.limit(10)
  end
end
