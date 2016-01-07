class ContractsController < ApplicationController
  before_action :set_contract, :set_client, :set_tool, :set_collections, only: [:show]

  def show
  end

  private

  def set_collections
    @clients = Client.all
    @tools = Tool.all
  end

  def set_client
    @client = Client.find(params[:id])
  end

  def set_tool
    @tool = Tool.find(params[:id])
  end

  def set_contract
    @contract = Contract.find(params[:id])
  end

  def contract_params
    params.require(:contract)
      .permit(:client, :tool, :term, :initial_date, :deadline, :total_price, :delivery_address, :responsable)
  end
end
