class HomeController < ApplicationController
  def index
    @clients = Client.all
    @tools = Tool.all
    @contracts = Contract.all
  end
end
