class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :create_delivery_receipt,
                                      :delivery_receipt, :devolution_receipt,
                                      :create_devolution_receipt]
  before_action :set_collections, only: [:show, :new, :create,
                                         :create_delivery_receipt,
                                         :delivery_receipt, :devolution_receipt,
                                         :create_devolution_receipt]

  def show
  end

  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.new(contract_params)
    if @contract.save
      redirect_to @contract
    else
      flash[:warning] = 'Atenção! Todos os campos são obrigatórios.'
      render :new
    end
  end

  def delivery_receipt
  end

  def create_delivery_receipt
    @delivery_receipt = DeliveryReceipt.new
    @delivery_receipt.contract = @contract
    @delivery_receipt.save
    redirect_to delivery_receipt_contract_path
  end

  def devolution_receipt
  end

  def create_devolution_receipt
    @devolution_receipt = DevolutionReceipt.new(employee: params[:employee],
                                                contract: @contract)
    if @devolution_receipt.save
      redirect_to devolution_receipt_contract_path
    else
      flash[:warning] = 'Atenção! O campo Funcionário é obrigatório.'
      render :show
    end
  end

  private

  def set_collections
    @clients = Client.all
    @tools = Tool.all
    @terms = Term::TERMS
  end

  def set_contract
    @contract = Contract.find(params[:id])
  end

  def contract_params
    params.require(:contract)
      .permit(:client_id, :term, :initial_date, :total_price,
              :delivery_address, :responsable, tool_ids: [])
  end
end
