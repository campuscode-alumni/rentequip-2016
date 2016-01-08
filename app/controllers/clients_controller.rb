class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to @client
    else
      render :new
    end
  end

  def show
    @client = Client.find(params[:id])
  end

  private

  def client_params
    params.require(:client)
      .permit(:company_name, :cnpj, :contact_name, :phone, :email,
              :address, :address_number, :aditional_address_detail,
              :zipcode, :neighborhood, :city, :state)
  end
end
