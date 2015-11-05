module Api
  module V1
    class ClientsController < ApplicationController
        include ActionController::MimeResponds


    # GET method - get all clients;
    # base_url/index

      def index
        @clients = Client.all
        render json: @clients
      end

    # GET method - get particular client;
    # base_url/clients/{id}

      def show
        @client = Client.find(params[:id])
        render json: @client
      end

    # POST method - create new client
    # base_url/clients
    # { "client": { 
          # "name":"Vilius",
          # "age": "21", 
          # "email": "new@gmail.com",
          # "start_date": "1989-01-12",
          # "active": true
        # }
    # }

      def create
        @client = Client.new(client_params)
        if @client.save
          render json: {message: 'created'}
          # render 'show', formats: [:json], status: 201
        else
          render json: {error: "Client could not be created"}, status: 422
        end
      end

      #DELETE method - delete client
      # base_url/clients/{id}

      def destroy
        @client = Client.find(params[:id])
        @client.destroy
        render json: {message: 'deleted'}
      end

      #PUT method - update client details
      # base_url/clients/{id}

      # { "client":
      #   {   
      #     "active": false
      #   }
      # }

        def update
          @client = Client.find(params[:id])
          @client.update!(client_params)
          render json: @client
        end

      def client_params
        # params.require(:client).permit(:name, :age, :email, :start_date, :active)
        params.require(:client).permit(:name, :age, :email, :start_date, :active)
      end
    end
  end
end














# class ClientsController < ApplicationController
#   # include ActionController::MimeResponds
#   # before_filter :restrict_access

#   def index

#     if params[:search]
#       @client = Client.search params[:search]
#       render json: @client   
#     else
#       @client = Client.all
#       render json: @client
#     end

#     if params[:status]
#       @client = @client.by_status (params[:status] == "true")
#       render json: @client
#     end
#   end


#   # def new
#   #   @client = Client.new
#   # end

#   def create
#     # @client = Client.new(client_params)
#     @client = Client.new(params[:name][:status])
 
#    # if @client.save
#    #    redirect_to clients_path, notice: "#{@client.name} was created successfully!"
#    #  else
#    #    render :new
#    #  end

#     if @client.save
#       render json: @client, status: :created, location: @client
#     else
#       render json: @client.errors, status: :unprocessable_entity
#     end
#   end

#   def destroy
#     @client = Client.find(params[:id])
#     @client.destroy
#     redirect_to clients_path
#   end

#   def edit
#       @client = Client.find(params[:id])
#   end

#    def update
#     @client = Client.find(params[:id])

#     if @client.update_attributes(client_params)
#       redirect_to client_path(@client)
#     else
#       render :edit
#     end
#   end 

#   def show
#     @client = Client.find(params[:id])
#     render json: @client
#   end

#   def check_in_workout
#     @client = Client.find(params[:id])
#     @client.check_in += 1
#     @client.save
#     redirect_to client_path(@client)
#   end

#   protected

#   def client_params
#     params.require(:client).permit(:name)
#   end
# end