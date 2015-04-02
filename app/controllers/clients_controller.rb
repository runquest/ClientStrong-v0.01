require 'byebug'

class ClientsController < ApplicationController
  
  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
 

   if @client.save
      redirect_to clients_path, notice: "#{@client.name} was created successfully!"
    else
      render :new
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to clients_path
  end

  def edit
      @client = Client.find(params[:id])
  end

   def update
    @client = Client.find(params[:id])

    if @client.update_attributes(client_params)
      redirect_to client_path(@client)
    else
      render :edit
    end
  end

  def index

    if params[:search]
      @client = Client.search params[:search]   
    else
      @client = Client.all
    end


    if params[:status]
      @client = @client.by_status (params[:status] == "true")
    end
  end

  def show
    @client = Client.find(params[:id])
  end




protected

  def client_params
    params.require(:client).permit(
      :name, :email, :age, :active, :start_date
      )
  end



end